import os
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, monotonically_increasing_id

os.environ["PYSPARK_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["PYSPARK_DRIVER_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["SPARK_LOCAL_HOSTNAME"] = "localhost"

POSTGRES_JAR = r"C:\Users\USER\Desktop\spark_etl_project\postgresql.jar"

JDBC_URL = "jdbc:postgresql://localhost:5432/censo_escolar"

CONNECTION_PROPERTIES = {
    "user": "censo",
    "password": "123",
    "driver": "org.postgresql.Driver"
}

spark = SparkSession.builder \
    .appName("CensoEscolarStarSchema") \
    .master("local[2]") \
    .config("spark.driver.memory", "6g") \
    .config("spark.driver.extraClassPath", POSTGRES_JAR) \
    .config("spark.executor.extraClassPath", POSTGRES_JAR) \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

print("Loading Parquet data...")

df = spark.read.parquet("output/parquet/*")

print("Rows loaded:", df.count())
print("Columns loaded:", len(df.columns))

# ------------------------------------------------
# Helper functions
# ------------------------------------------------

def clean_column_names(dataframe):
    new_df = dataframe
    for c in new_df.columns:
        new_df = new_df.withColumnRenamed(c, c.strip())
    return new_df

df = clean_column_names(df)

def existing_columns(cols):
    return [c for c in cols if c in df.columns]

def write_table(dataframe, table_name, mode="overwrite"):
    print(f"Writing {table_name}...")
    dataframe.write.jdbc(
        url=JDBC_URL,
        table=table_name,
        mode=mode,
        properties=CONNECTION_PROPERTIES
    )
    print(f"{table_name} written.")

def create_binary_dimension(source_df, column_name, table_name, id_name):
    if column_name not in source_df.columns:
        print(f"Column missing: {column_name}, skipping {table_name}")
        return None

    dim = source_df.select(col(column_name).alias(column_name.lower())) \
        .dropDuplicates() \
        .withColumn(id_name, monotonically_increasing_id()) \
        .select(id_name, column_name.lower())

    write_table(dim, table_name)
    return dim

# ------------------------------------------------
# Dimension: Location
# ------------------------------------------------

location_cols = existing_columns([
    "NO_UF",
    "SG_UF",
    "CO_UF",
    "NO_MUNICIPIO",
    "CO_MUNICIPIO"
])

if len(location_cols) < 2:
    raise Exception("Location columns not found. Check CSV columns.")

dim_local = df.select(*location_cols).dropDuplicates()

for c in location_cols:
    dim_local = dim_local.withColumnRenamed(c, c.lower())

dim_local = dim_local.withColumn("id_local", monotonically_increasing_id())

ordered_local_cols = ["id_local"] + [c.lower() for c in location_cols]
dim_local = dim_local.select(*ordered_local_cols)

write_table(dim_local, "dim_local")

# ------------------------------------------------
# Dimension: TP_DEPENDENCIA
# ------------------------------------------------

if "TP_DEPENDENCIA" in df.columns:
    dim_tp_dependencia = df.select("TP_DEPENDENCIA") \
        .dropDuplicates() \
        .withColumn("id_tp_dependencia", monotonically_increasing_id()) \
        .withColumnRenamed("TP_DEPENDENCIA", "tp_dependencia") \
        .select("id_tp_dependencia", "tp_dependencia")

    write_table(dim_tp_dependencia, "dim_tp_dependencia")
else:
    dim_tp_dependencia = None
    print("TP_DEPENDENCIA missing.")

# ------------------------------------------------
# Dimension: TP_LOCALIZACAO
# ------------------------------------------------

if "TP_LOCALIZACAO" in df.columns:
    dim_tp_localizacao = df.select("TP_LOCALIZACAO") \
        .dropDuplicates() \
        .withColumn("id_tp_localizacao", monotonically_increasing_id()) \
        .withColumnRenamed("TP_LOCALIZACAO", "tp_localizacao") \
        .select("id_tp_localizacao", "tp_localizacao")

    write_table(dim_tp_localizacao, "dim_tp_localizacao")
else:
    dim_tp_localizacao = None
    print("TP_LOCALIZACAO missing.")

# ------------------------------------------------
# Binary infrastructure dimensions
# ------------------------------------------------

binary_dimensions = {
    "IN_AGUA_POTAVEL": ("dim_in_agua_potavel", "id_in_agua_potavel"),
    "IN_BANHEIRO": ("dim_in_banheiro", "id_in_banheiro"),
    "IN_BIBLIOTECA": ("dim_in_biblioteca", "id_in_biblioteca"),
    "IN_COMPUTADOR": ("dim_in_computador", "id_in_computador"),
    "IN_ENERGIA_INEXISTENTE": ("dim_in_energia_inexistente", "id_in_energia_inexistente"),
    "IN_EQUIP_NENHUM": ("dim_in_equip_nenhum", "id_in_equip_nenhum"),
    "IN_ESGOTO_INEXISTENTE": ("dim_in_esgoto_inexistente", "id_in_esgoto_inexistente"),
    "IN_INTERNET": ("dim_in_internet", "id_in_internet"),
    "IN_REFEITORIO": ("dim_in_refeitorio", "id_in_refeitorio"),
}

dim_objects = {}

for source_col, (table_name, id_name) in binary_dimensions.items():
    dim = create_binary_dimension(df, source_col, table_name, id_name)
    dim_objects[source_col] = (dim, table_name, id_name)

# ------------------------------------------------
# Fact table
# ------------------------------------------------

print("Building fact table...")

fact = df

# Cast numeric columns
numeric_candidates = [
    "ANO",
    "CO_ENTIDADE",
    "QT_MAT_BAS",
    "QT_MAT_INF",
    "QT_MAT_FUND",
    "QT_MAT_MED",
    "QT_MAT_EJA",
    "QT_MAT_ESP",
]

for c in numeric_candidates:
    if c in fact.columns:
        fact = fact.withColumn(c, col(c).cast("long"))

# Join location
join_local_left = location_cols
join_local_right = [c.lower() for c in location_cols]

fact = fact.join(
    dim_local,
    on=[fact[l] == dim_local[r] for l, r in zip(join_local_left, join_local_right)],
    how="left"
)

# Join TP_DEPENDENCIA
if dim_tp_dependencia is not None:
    fact = fact.join(
        dim_tp_dependencia,
        fact["TP_DEPENDENCIA"] == dim_tp_dependencia["tp_dependencia"],
        "left"
    )

# Join TP_LOCALIZACAO
if dim_tp_localizacao is not None:
    fact = fact.join(
        dim_tp_localizacao,
        fact["TP_LOCALIZACAO"] == dim_tp_localizacao["tp_localizacao"],
        "left"
    )

# Join binary dimensions
for source_col, (dim, table_name, id_name) in dim_objects.items():
    if dim is not None:
        fact = fact.join(
            dim,
            fact[source_col] == dim[source_col.lower()],
            "left"
        )

# Select final fact columns
fact_cols = []

if "ANO" in fact.columns:
    fact_cols.append(col("ANO").alias("year"))

if "CO_ENTIDADE" in fact.columns:
    fact_cols.append(col("CO_ENTIDADE").alias("school_code"))

fact_cols.append(col("id_local"))

if "id_tp_dependencia" in fact.columns:
    fact_cols.append(col("id_tp_dependencia"))

if "id_tp_localizacao" in fact.columns:
    fact_cols.append(col("id_tp_localizacao"))

for source_col, (dim, table_name, id_name) in dim_objects.items():
    if dim is not None and id_name in fact.columns:
        fact_cols.append(col(id_name))

# Metrics
metric_cols = [
    "QT_MAT_BAS",
    "QT_MAT_INF",
    "QT_MAT_FUND",
    "QT_MAT_MED",
    "QT_MAT_EJA",
    "QT_MAT_ESP",
]

for c in metric_cols:
    if c in fact.columns:
        fact_cols.append(col(c).alias(c.lower()))

fact_censo = fact.select(*fact_cols)

print("Fact rows:", fact_censo.count())
fact_censo.printSchema()

write_table(fact_censo, "fact_censo_escolar")

spark.stop()

print("Star schema completed successfully.")