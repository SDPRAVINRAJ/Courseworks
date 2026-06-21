import os
from pyspark.sql import SparkSession

# Force PySpark to use this project's virtual environment Python
os.environ["PYSPARK_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["PYSPARK_DRIVER_PYTHON"] = r"C:\Users\USER\Desktop\spark_etl_project\venv\Scripts\python.exe"
os.environ["SPARK_LOCAL_HOSTNAME"] = "localhost"

# Absolute path to PostgreSQL JDBC driver
postgres_jar = r"C:\Users\USER\Desktop\spark_etl_project\postgresql.jar"

spark = SparkSession.builder \
    .appName("Test PostgreSQL Connection") \
    .master("local[1]") \
    .config("spark.driver.extraClassPath", postgres_jar) \
    .config("spark.executor.extraClassPath", postgres_jar) \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

data = [
    (1, "Laptop", 2500),
    (2, "Mouse", 50),
    (3, "Keyboard", 120)
]

df = spark.createDataFrame(data, ["product_id", "product_name", "price"])

jdbc_url = "jdbc:postgresql://localhost:5432/censo_escolar"

connection_properties = {
    "user": "censo",
    "password": "123",
    "driver": "org.postgresql.Driver"
}

df.write.jdbc(
    url=jdbc_url,
    table="test_products",
    mode="overwrite",
    properties=connection_properties
)

spark.stop()

print("Data written to PostgreSQL successfully.")