# How to Enable Unity Catalog on Azure Databricks

Unity Catalog is a feature that provides cataloging and governance for the databricks lake house. It allows users to manage and access data across multiple workspaces and storage accounts, and supports data lineage, permissions, and insights.

To enable Unity Catalog on Azure Databricks, you need to create a Unity Catalog metastore, which is a top-level container for catalogs, schemas, and tables. You can share a single metastore across multiple Azure Databricks workspaces in an account, as long as they are in the same region.

## Step 1: Create a Unity Catalog metastore

1. As an account admin, log in to the account console.
2. Click **Metastores**.
3. Click **Create Metastore**.
4. Provide a name and a region for the metastore. The name must be unique within the account and the region.
5. Provide an ADLS Gen2 path for the metastore. This is where the metadata and the data for managed tables and managed volumes will be stored. You can use an existing storage account or create a new one.
6. Click **Create**.

## Step 2: Create an access connector for Azure Databricks

1. As an account admin, log in to the account console.
2. Click **Access Connectors**.
3. Click **Create Access Connector**.
4. Select **Azure Databricks** as the type of access connector.
5. Provide a name and a region for the access connector. The name must be unique within the account and the region must match the metastore region.
6. Click **Create**.
7. Copy the resource ID of the access connector. You will need it to enable your workspace for Unity Catalog.

## Step 3: Assign the Unity Catalog resource to a workspace

1. As an account admin, log in to the account console.
2. Click **Workspaces**.
3. Select the workspace that you want to enable for Unity Catalog. The workspace must be in the same region as the metastore and the access connector.
4. Click **Edit**.
5. Click **Enable Unity Catalog**.
6. Select the metastore that you created in step 1.
7. Paste the resource ID of the access connector that you created in step 2.
8. Click **Enable**.

## Step 4: Create a new catalog in the data explorer

1. As a workspace admin or a user with the `catalog:create` privilege, launch the workspace that you enabled for Unity Catalog.
2. Click **Data** in the sidebar.
3. Click **Create Catalog**.
4. Provide a name and an external location for the catalog. The external location is a storage account where the data for the catalog will be stored. You can use the same storage account as the metastore or a different one.
5. Click **Create**.

You have successfully enabled Unity Catalog on Azure Databricks and created a new catalog. You can now create schemas and tables in the catalog, and grant permissions to other users or groups. For more information, see [Set up and manage Unity Catalog](https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/create-metastore).
