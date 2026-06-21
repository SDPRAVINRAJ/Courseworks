import os
from pyspark.sql import SparkSession

os.environ["PYSPARK_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["PYSPARK_DRIVER_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["SPARK_LOCAL_HOSTNAME"] = "localhost"

spark = SparkSession.builder \
    .appName("Test Spark") \
    .master("local[1]") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

data = [
    (1, "Ali"),
    (2, "Siti"),
    (3, "Ravi")
]

df = spark.createDataFrame(data, ["id", "name"])
df.show()

spark.stop()

print("Spark test successful.")