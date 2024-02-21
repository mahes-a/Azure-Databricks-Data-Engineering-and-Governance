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
- Follow the steps in [01.Provision identities to your Azure Databricks account using Microsoft Entra ID](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/01.Provision%20identities%20to%20your%20Azure%20Databricks%20account%20using%20Microsoft%20Entra%20ID.md)
- Ensure you have the right privileges required to setup the provisioning

  
## Setting up Your first unity catalog

- Follow the steps in [02.Enable Unity Catalog on Azure Databricks](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/02.Enable%20Unity%20Catalog%20on%20Azure%20Databricks.md)
- Ensure you have the right privileges required to setup the provisioning
- Setup a cluster to execute the Notebooks , [Refer here to create clusters](https://learn.microsoft.com/en-us/azure/databricks/compute/configure)
- Import and Execute the [03.Getting Started with Unity Catalog.sql
](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/03.Getting%20Started%20with%20Unity%20Catalog.sql)



## Setting up Your Delta Share

- Import and execute the [04.Delta Sharing Getting Started](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/04.Delta%20Sharing%20Getting%20Started.sql)
- Follow the steps in [05.DeltaSharingrecipients
](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/05.DeltaSharingrecipients.md)



## Delta Lake Basics

- Import and execute the [06.Delta Lake Basics](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/06.Delta%20Lake%20Basics.py)

## Setup your Medallion Architecture 

- Import and execute the [07.Delta Lake Medallion.py](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/07.Delta%20Lake%20Medallion.py)


## Delta Live Table with Medallion Architecture

- Import the [08.DeltaLiveMedallion](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/08.DeltaLiveMedallion.py)
  
- Follow the steps in [09.Create DLT Pipeline from UI](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/09.Create%20DLT%20Pipeline%20from%20UI.md)


## Clean-up Resources

- Follow the steps in [10.Clean Up of Resources](https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/blob/main/10.Clean%20Up%20of%20Resources.md)



