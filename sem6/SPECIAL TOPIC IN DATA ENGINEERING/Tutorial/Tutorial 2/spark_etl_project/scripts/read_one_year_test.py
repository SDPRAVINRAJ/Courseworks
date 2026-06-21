import os
from pyspark.sql import SparkSession

os.environ["PYSPARK_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["PYSPARK_DRIVER_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["SPARK_LOCAL_HOSTNAME"] = "localhost"

spark = SparkSession.builder \
    .appName("Read One Censo Year") \
    .master("local[1]") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

file_path = "data/2021.csv"

def read_csv(sep):
    return spark.read.csv(
        file_path,
        header=True,
        sep=sep,
        encoding="latin1",
        inferSchema=False
    )

df_semicolon = read_csv(";")
df_pipe = read_csv("|")

if len(df_pipe.columns) > len(df_semicolon.columns):
    df = df_pipe
    chosen_sep = "|"
else:
    df = df_semicolon
    chosen_sep = ";"

print(f"Chosen separator: {chosen_sep}")
print(f"Number of columns: {len(df.columns)}")
print("First 60 columns:")
print(df.columns[:60])

print("Sample data:")
df.show(5, truncate=False)

spark.stop()