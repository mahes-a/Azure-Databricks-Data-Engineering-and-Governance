-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Unity Catalog Quickstart (SQL)
-- MAGIC
-- MAGIC This notebook provides an example workflow for getting started with Unity Catalog by showing how to do the following:
-- MAGIC
-- MAGIC - Choose a catalog and create a new schema.
-- MAGIC - Create a managed table and add it to the schema.
-- MAGIC - Query the table using the three-level namespace.
-- MAGIC - Manage data access permissions on the table.
-- MAGIC
-- MAGIC ## Requirements
-- MAGIC
-- MAGIC - The workspace must be attached to a Unity Catalog metastore. See https://docs.databricks.com/data-governance/unity-catalog/get-started.html.
-- MAGIC - The notebook must be attached to a SQL warehouse or a cluster that uses DBR 11.3LTS or above and uses the single user or shared cluster access mode. See https://docs.databricks.com/en/data-governance/unity-catalog/compute.html.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Three-level namespace
-- MAGIC
-- MAGIC Unity Catalog provides a three-level namespace for organizing data: catalogs, schemas (also called databases), and tables and views. To refer to a table, use the following syntax
-- MAGIC
-- MAGIC >`<catalog>.<schema>.<table>`
-- MAGIC
-- MAGIC If you already have data in a Databricks workspace's local Hive metastore or an external Hive metastore, Unity Catalog is **additive**: the workspace’s Hive metastore becomes one catalog within the 3-layer namespace (called `hive_metastore`) and tables in the Hive metastore can be accessed using three-level namespace notation: `hive_metastore.<schema>.<table>`.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Create a new catalog
-- MAGIC
-- MAGIC To create a catalog, use the `CREATE CATALOG` command with `spark.sql`. You must be a metastore admin or user with the `CREATE CATALOG` privilege on the metastore to create a catalog.  If your workspace was enabled for Unity Catalog by default, then workspace admins have the `CREATE CATALOG` privilege by default. See https://docs.databricks.com/data-governance/unity-catalog/get-started.md#auto-enabled-check.
-- MAGIC
-- MAGIC If your workspace was enabled for Unity Catalog by default, then there may be no managed storage location for the metastore, and you must create a location for the new catalog. See https://docs.databricks.com/data-governance/unity-catalog/manage-external-locations-and-credentials.html.
-- MAGIC
-- MAGIC The following commands show how to:
-- MAGIC
-- MAGIC - Create a new catalog.
-- MAGIC - Select a catalog.
-- MAGIC - Show all catalogs.
-- MAGIC - Grant permissions on a catalog.
-- MAGIC - Show all grants on a catalog.

-- COMMAND ----------

  --drop table quickstart_catalog.quickstart_schema.quickstart_table;

-- COMMAND ----------

-- create a new catalog
CREATE CATALOG IF NOT EXISTS quickstart_catalog;

-- create a catalog and specify the managed location
-- CREATE CATALOG IF NOT EXISTS quickstart_catalog MANAGED LOCATION '<location-path>';

-- COMMAND ----------

-- Set the current catalog
USE CATALOG quickstart_catalog;

-- COMMAND ----------

--- Show all catalogs in a metastore
SHOW CATALOGS;

-- COMMAND ----------

--- Grant create schema, create table, & use catalog permissions to all users on the account
--- This also works for other account-level groups and individual users
GRANT CREATE SCHEMA, CREATE TABLE, USE CATALOG
ON CATALOG quickstart_catalog
TO `account users`;

-- COMMAND ----------

--- Check grants on the quickstart catalog
SHOW GRANT ON CATALOG quickstart_catalog;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Create and manage schemas
-- MAGIC Schemas, also referred to as databases, are the second layer of the Unity Catalog namespace. They logically organize tables and views.

-- COMMAND ----------

--- Create a new schema in the quick_start catalog
CREATE SCHEMA IF NOT EXISTS quickstart_schema
COMMENT "A new Unity Catalog schema called quickstart_schema";

-- COMMAND ----------

-- Show schemas in the selected catalog
SHOW SCHEMAS;

-- COMMAND ----------

-- Describe a schema
DESCRIBE SCHEMA EXTENDED quickstart_schema;

-- COMMAND ----------

-- Drop a schema (uncomment the following line to try it. Be sure to re-create the schema before continuing with the rest of the notebook.)
-- DROP SCHEMA quickstart_schema CASCADE

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Create a managed table
-- MAGIC
-- MAGIC *Managed tables* are the default way to create table with Unity Catalog. The table is created in the managed storage location configured for the metastore, catalog, or schema.
-- MAGIC
-- MAGIC The following commands show how to:
-- MAGIC - Select a schema.
-- MAGIC - Create a managed table and insert records into it.
-- MAGIC - Show all tables in a schema.
-- MAGIC - Describe a table.

-- COMMAND ----------

-- Set the current schema
USE quickstart_schema;

-- COMMAND ----------

-- Create a managed Delta table and insert two records
CREATE TABLE IF NOT EXISTS quickstart_table
  (columnA Int, columnB String) PARTITIONED BY (columnA)
TBLPROPERTIES ('delta.enableDeletionVectors' = 'false');

INSERT INTO TABLE quickstart_table
VALUES
  (1, "one"),
  (2, "two");

-- COMMAND ----------

-- View all tables in the schema
SHOW TABLES IN quickstart_schema;

-- COMMAND ----------

-- Describe this table
DESCRIBE TABLE EXTENDED quickstart_table;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC With the three level namespaces you can access tables in several different ways:
-- MAGIC - Access the table with a fully qualified name.
-- MAGIC - Select a default catalog and access the table using the schema and table name.
-- MAGIC - Select a default schema and use the table name.
-- MAGIC
-- MAGIC The following three commands are functionally equivalent.

-- COMMAND ----------

-- Query the table using the three-level namespace
SELECT
  *
FROM
  quickstart_catalog.quickstart_schema.quickstart_table;

-- COMMAND ----------

-- Set the default catalog and query the table using the schema and table name
USE CATALOG quickstart_catalog;
SELECT *
FROM quickstart_schema.quickstart_table;

-- COMMAND ----------

-- Set the default catalog and default schema and query the table using the table name
USE CATALOG quickstart_catalog;
USE quickstart_schema;
SELECT *
FROM quickstart_table;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #### Drop Table
-- MAGIC If a *managed table* is dropped with the `DROP TABLE` command, the underlying data files are removed as well. 
-- MAGIC
-- MAGIC If an *external table* is dropped with the `DROP TABLE` command, the metadata about the table is removed from the catalog but the underlying data files are not deleted. 

-- COMMAND ----------

-- Drop the managed table. Uncomment the following line to try it out. Be sure to re-create the table before continuing.
-- DROP TABLE quickstart_catalog.quickstart_schema.quickstart_table

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Manage permissions on data
-- MAGIC
-- MAGIC You use `GRANT` and `REVOKE` statements to manage access to your data. Unity Catalog is secure by default, and access to data is not automatically granted. Initially, all users have no access to data. Metastore admins and data object owners can grant and revoke access to users and groups. Grants are inherited on child securable objects.
-- MAGIC
-- MAGIC #### Ownership
-- MAGIC Each object in Unity Catalog has an owner. The owner can be any user, service principal, or group, all referred to in this notebook by the general term *principals*. A principal becomes the owner of a securable object when they create it or when ownership is transferred by using an `ALTER` statement.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Manage privileges
-- MAGIC The following privileges can be granted on Unity Catalog objects:
-- MAGIC - `CREATE CATALOG`: Allows the grantee to create catalogs within a metastore.
-- MAGIC - `CREATE EXTERNAL LOCATION`: When applied to a storage credential, allows the grantee to create an external location using the storage credential. When applied to a metastore, allows the grantee to create an external location.
-- MAGIC - `CREATE FUNCTION`: Allows the grantee to create functions within a catalog.
-- MAGIC - `CREATE SCHEMA`: Allows the grantee to create schemas within a catalog.
-- MAGIC - `CREATE TABLE`: Allows the grantee to create tables within a schema.
-- MAGIC - `EXECUTE`: Allows the grantee to to invoke a user defined function.
-- MAGIC - `MODIFY`: Allows the grantee to insert, update and delete data to or from a table.
-- MAGIC - `SELECT`: Allows the grantee to read data from a table or view.
-- MAGIC - `USE CATALOG`: This privilege does not grant access to the securable object itself, but allow the grantee to traverse the catalog in order to access its child objects. 
-- MAGIC - `USE SCHEMA`: This privilege does not grant access to the securable object itself, but allow the grantee to traverse the schema in order to access its child objects. For example, to select data from a table, a user needs the `SELECT` privilege on that table, the `USE SCHMEA` privilege on its parent schema, and the `USE CATALOG` privilege on its parent catalog. You can use this privilege to restrict access to sections of your data namespace to specific groups.
-- MAGIC
-- MAGIC Three additional privileges are relevant only to external tables and external storage locations that contain data files.
-- MAGIC
-- MAGIC - `CREATE EXTERNAL TABLE`: Allows the grantee to create an external table at a given external location.
-- MAGIC - `READ FILES`: Allows the grantee to read data files from a given external location.
-- MAGIC - `WRITE FILES`: Allows the grantee to write data files to a given external location.
-- MAGIC
-- MAGIC Privileges are inherited on child securable objects. Granting a privilege on a securable grants the privilege on its child securables.
-- MAGIC
-- MAGIC The following commands show how to:
-- MAGIC - Grant privileges.
-- MAGIC - Show grants on a securable object.
-- MAGIC - Revoke a privilege.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Grant a privilege**: Grants a privilege on securable objects to a principal. Only metastore admins and owners of the securable object can perform privilege granting.

-- COMMAND ----------

-- Grant USE SCHEMA on a schema
GRANT USE SCHEMA
ON SCHEMA quickstart_schema
TO `account users`;

-- COMMAND ----------

-- Grant SELECT privilege on a table to a principal
GRANT SELECT
ON TABLE quickstart_schema.quickstart_table
TO `account users`;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Show grants**: Lists all privileges that are granted on a securable object.

-- COMMAND ----------

-- Show grants on quickstart_table
SHOW GRANTS
ON TABLE quickstart_catalog.quickstart_schema.quickstart_table;

-- COMMAND ----------

-- Show grants on quickstart_schema
SHOW GRANTS
ON SCHEMA quickstart_catalog.quickstart_schema;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Revoke a privilege**: Revokes a previously granted privilege on a securable object from a principal.

-- COMMAND ----------

--REVOKE SELECT
--ON TABLE quickstart_schema.quickstart_table
--FROM `account users`;
