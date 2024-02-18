# Databricks notebook source
json_path = "/databricks-datasets/wikipedia-datasets/data-001/clickstream/raw-uncompressed-json/2015_2_clickstream.json"

# COMMAND ----------

# MAGIC %sql
# MAGIC CREATE CATALOG IF NOT EXISTS quickstart_catalog;
# MAGIC USE CATALOG quickstart_catalog;

# COMMAND ----------

# MAGIC %sql
# MAGIC --create schema
# MAGIC CREATE SCHEMA IF NOT EXISTS bronze_schema
# MAGIC COMMENT "A new Unity Catalog schema called bronze_schema";

# COMMAND ----------

# Read the JSON data into a DataFrame
clickstream_df = spark.read.json(json_path)

# Create a Delta table from the DataFrame with auto optimize write enabled
clickstream_df.write.format("delta").option("autoOptimize", "true").mode("overwrite").saveAsTable("quickstart_catalog.bronze_schema.bronze_table")

# COMMAND ----------

# MAGIC
# MAGIC %sql
# MAGIC --Create the silver schema if it does not exist
# MAGIC CREATE SCHEMA IF NOT EXISTS silver_schema;

# COMMAND ----------

from pyspark.sql.functions import expr

# Read from the bronze table
bronze_df = spark.sql("SELECT * FROM quickstart_catalog.bronze_schema.bronze_table")

# Perform data duplicate checks
deduped_df = bronze_df.dropDuplicates()

# Create the silver table with renamed column names
silver_table = deduped_df.withColumn("click_count", expr("CAST(n AS INT)")) \
    .withColumnRenamed("curr_title", "current_page_title") \
    .withColumnRenamed("prev_title", "previous_page_title") \
    .select("current_page_title", "click_count", "previous_page_title")

# Create a Delta table from the silver DataFrame
silver_table.write.format("delta").option("autoOptimize", "true").mode("overwrite").saveAsTable("quickstart_catalog.silver_schema.silver_table")

# COMMAND ----------

# MAGIC
# MAGIC %sql
# MAGIC --Create the gold schema if it does not exist
# MAGIC CREATE SCHEMA IF NOT EXISTS quickstart_catalog.gold_schema;

# COMMAND ----------

from pyspark.sql.functions import sum

# Read the silver table
silver_table = spark.sql("SELECT * FROM quickstart_catalog.silver_schema.silver_table")

# Perform data transformation and aggregation to create gold table
gold_table = silver_table.groupby("previous_page_title", "current_page_title").agg(sum("click_count").alias("total_clicks"))

# Create a Delta table from the gold DataFrame
gold_table.write.format("delta").mode("overwrite").saveAsTable("quickstart_catalog.gold_schema.gold_table")
