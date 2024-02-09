-- Databricks notebook source
-- Set the current catalog
USE CATALOG quickstart_catalog;

-- COMMAND ----------



CREATE SHARE IF NOT EXISTS quickstart_share_1 
COMMENT 'Sharing columnA is 1 in quickstart_table';

-- we'll grant ownership to all users. 
ALTER SHARE quickstart_share_1 OWNER TO `account users`;


-- COMMAND ----------

ALTER SHARE quickstart_share_1 
  ADD TABLE quickstart_catalog.quickstart_schema.quickstart_table
  PARTITION (columnA = "1") as quickstart_share_1.`1`;


-- COMMAND ----------

SHOW ALL IN SHARE quickstart_share_1;
