# Databricks notebook source
json_path = '/databricks-datasets/wikipedia-datasets/data-001/clickstream/raw-uncompressed-json/2015_2_clickstream.json'

# COMMAND ----------

# MAGIC %sql
# MAGIC
# MAGIC -- Creating a catalog if it doesn't already exist
# MAGIC CREATE CATALOG IF NOT EXISTS quickstart_catalog;
# MAGIC
# MAGIC -- Using the quickstart_catalog
# MAGIC USE CATALOG quickstart_catalog;

# COMMAND ----------

# MAGIC
# MAGIC %sql
# MAGIC --Create the silver schema if it does not exist
# MAGIC CREATE SCHEMA IF NOT EXISTS deltalake_basics;
# MAGIC
# MAGIC use SCHEMA deltalake_basics
# MAGIC

# COMMAND ----------

# Read the JSON data
df = spark.read.json(json_path)

# Create a Delta table in the deltalake_basics schema
df.write.format("delta").mode("overwrite").saveAsTable("deltalake_basics.delta_data")

# COMMAND ----------

# Read the airport-codes-na.txt dataset
df = spark.read.option("header", "true").option("delimiter", "\t").csv("dbfs:/databricks-datasets/flights/airport-codes-na.txt")

# Create a parquet table in the deltalake_basics schema
df.write.format("delta").mode("overwrite").saveAsTable("deltalake_basics.airport_codes")

# COMMAND ----------

# MAGIC %md
# MAGIC if existing parquet table exists you can use below to convert to delta table
# MAGIC
# MAGIC %sql
# MAGIC -- Convert airport_codes parquet table to Delta format
# MAGIC
# MAGIC
# MAGIC CONVERT TO DELTA deltalake_basics.airport_codes;

# COMMAND ----------

# Read the airport_codes table as a streaming DataFrame
# Create a stream from deltalake_basics.airport_codes aggregating based on country
df_stream = spark.readStream.option("ignoreDeletes", "true").option("ignoreChanges", "true").table("deltalake_basics.airport_codes").groupBy("Country").count()

# Display the stream
display(df_stream)

# COMMAND ----------

# DBTITLE 1,Insert a country and see the stream above update 
#Insery=t rows deltalake_basics.airport_codes table
spark.sql("INSERT INTO deltalake_basics.airport_codes (City, State, Country, IATA) VALUES ('New Delhi', 'Delhi', 'India', 'DEL')")

# COMMAND ----------

# Delete rows from deltalake_basics.airport_codes where Country is 'India'
spark.sql("DELETE FROM deltalake_basics.airport_codes WHERE Country = 'India'")

# COMMAND ----------

# Stop the streaming query
#cancel the stream running in cmd7

# COMMAND ----------



# Define the data as a list of tuples
data = [('Chennai', 'Tamil Nadu', 'India', 'MAA')]

# Define the column names as a list
columns = ['City', 'State', 'Country', 'IATA']

# Create a DataFrame using the data and column names
df = spark.createDataFrame(data, columns)

# COMMAND ----------

# Assuming `df` is a DataFrame
df.createOrReplaceTempView("tempview")

# COMMAND ----------

# Upsert data from tempview to deltalake_basics.airport_codes using merge
spark.sql("""
    MERGE INTO deltalake_basics.airport_codes AS target
    USING tempview AS source
    ON target.City = source.City and target.State = source.State and target.Country = source.Country
    WHEN MATCHED THEN
        UPDATE SET 
            target.IATA = source.IATA
    WHEN NOT MATCHED THEN
        INSERT (City, State, Country, IATA)
        VALUES (source.City, source.State, source.Country, source.IATA)
""")

# COMMAND ----------

# MAGIC %sql
# MAGIC
# MAGIC -- Show history from airport_codes table
# MAGIC DESCRIBE HISTORY deltalake_basics.airport_codes;

# COMMAND ----------

# MAGIC %sql
# MAGIC
# MAGIC -- Select a specific version from airport_codes table
# MAGIC SELECT * FROM deltalake_basics.airport_codes VERSION AS OF 1; 
# MAGIC
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC -- Restore to current version
# MAGIC RESTORE deltalake_basics.airport_codes VERSION AS OF 2;

# COMMAND ----------

# Optimize the table manually
spark.sql("OPTIMIZE deltalake_basics.airport_codes")

# COMMAND ----------

# Enable auto optimize for the table
spark.sql("ALTER TABLE deltalake_basics.airport_codes SET TBLPROPERTIES ('delta.autoOptimize.optimizeWrite' = 'true')")

# COMMAND ----------

# MAGIC %sql
# MAGIC -- VACUUM command retains 172 hours of data and removes files that are older than that.
# MAGIC VACUUM deltalake_basics.airport_codes RETAIN 172 HOURS;

# COMMAND ----------

# MAGIC %sql
# MAGIC OPTIMIZE deltalake_basics.airport_codes
# MAGIC ZORDER BY (country, city);

# COMMAND ----------

# MAGIC %sql
# MAGIC CREATE OR REPLACE TABLE deltalake_basics.airport_codes_clustered CLUSTER BY (country, city)
# MAGIC   AS SELECT * FROM deltalake_basics.airport_codes;
