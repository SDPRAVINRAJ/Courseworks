import os
from pyspark.sql import SparkSession
from pyspark.sql.functions import lit

os.environ["PYSPARK_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["PYSPARK_DRIVER_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["SPARK_LOCAL_HOSTNAME"] = "localhost"

YEARS = list(range(2010, 2022))

spark = SparkSession.builder \
    .appName("Convert Censo CSV to Parquet") \
    .master("local[2]") \
    .config("spark.driver.memory", "4g") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

def read_csv_auto(file_path):
    df_semicolon = spark.read.csv(
        file_path,
        header=True,
        sep=";",
        encoding="latin1",
        inferSchema=False
    )

    df_pipe = spark.read.csv(
        file_path,
        header=True,
        sep="|",
        encoding="latin1",
        inferSchema=False
    )

    if len(df_pipe.columns) > len(df_semicolon.columns):
        return df_pipe, "|"

    return df_semicolon, ";"

for year in YEARS:
    input_path = f"data/{year}.csv"
    output_path = f"output/parquet/year={year}"

    if not os.path.exists(input_path):
        print(f"{year}: CSV missing, skipping.")
        continue

    print(f"\nProcessing {year}...")

    df, sep = read_csv_auto(input_path)

    print(f"{year}: separator = {sep}")
    print(f"{year}: columns = {len(df.columns)}")

    df = df.withColumn("ANO", lit(year))

    df.write.mode("overwrite").parquet(output_path)

    print(f"{year}: saved to {output_path}")

spark.stop()

print("\nAll files converted to Parquet.")