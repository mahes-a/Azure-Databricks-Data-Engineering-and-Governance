# Azure-Databricks-Data-Engineering-and-Governance
Unlock the full potential of your data lake with Delta Lake, streamline user management with SCIM, ensure data governance with Unity Catalog, optimize data processing with the Medallion architecture, automate and simplify ETL with Delta Live Tables, and enable secure, real-time data sharing with Delta Sharing

# Modules Covered
- Provisioning identities to your Azure Databricks account using Microsoft Entra ID
- Setting up Unity Catalog on Azure Databricks
- Setup Delta Sharing  that enables sharing of data and AI assets with users inside or outside your organization, irrespective of whether they use Databricks.
- Bring reliability to the data lake with Delta Lake 
- Set up a simple Medallion Architecture
- How to set up simple Medallion Architecture using Delta Live Tables


# Exceution Steps 

## Provisioning identities to your Azure Databricks account using Microsoft Entra ID
- Follow the steps in [01.Provision identities to your Azure Databricks account using Microsoft Entra ID.md](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/01.Provision%20identities%20to%20your%20Azure%20Databricks%20account%20using%20Microsoft%20Entra%20ID.md)
- Ensure you have the right privileges required to setup the provisioning 

## Setting up Your first unity catalog

- Follow the steps in [02.Enable Unity Catalog on Azure Databricks.md](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/02.Enable%20Unity%20Catalog%20on%20Azure%20Databricks.md)
- Ensure you have the right privileges required to setup the provisioning 

## Medallion Architecture

- Import the green_tripdata_2023-09.parquet and taxizonelookup.csv into DBFS

  <img width="383" alt="image" src="https://github.com/mahes-a/AzureDatabricksDataEngineering/assets/120069348/300e65ee-1452-4434-b6a7-e909300a0ae1">

- Import the MedallionDelta.dbc and execute the SimpleMedallion notebook

  <img width="204" alt="image" src="https://github.com/mahes-a/AzureDatabricksDataEngineering/assets/120069348/1e1ad874-96f4-4724-84f7-2641270e69a7">


## Delta Live Table with Medallion Architecture

- Import the DeltaLiveTable.dbc into user folder
  
- Setup the DeltaLive table using below notebook

  <img width="397" alt="image" src="https://github.com/mahes-a/AzureDatabricksDataEngineering/assets/120069348/c7a27d7a-3dbf-4425-80bc-e4404b997b36">
