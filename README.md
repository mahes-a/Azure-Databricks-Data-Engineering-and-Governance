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


##

 This Sample Code is provided for the purpose of illustration only and is not intended to be used
 in a production environment. THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS"
 WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. We grant You a nonexclusive,
 royalty-free right to use and modify the Sample Code and to reproduce and distribute the object code
 form of the Sample Code, provided that You agree: (i) to not use Our name, logo, or trademarks to
 market Your software product in which the Sample Code is embedded; (ii) to include a valid copyright
 notice on Your software product in which the Sample Code is embedded; and (iii) to indemnify, hold
 harmless, and defend Us and Our suppliers from and against any claims or lawsuits, including attorneys
 fees, that arise or result from the use or distribution of the Sample Code.
 
 This sample script is not supported under any Microsoft standard support program or service.
 The sample script is provided AS IS without warranty of any kind. Microsoft further disclaims
 all implied warranties including, without limitation, any implied warranties of merchantability
 or of fitness for a particular purpose. The entire risk arising out of the use or performance of
 the sample scripts and documentation remains with you. In no event shall Microsoft, its authors,
 or anyone else involved in the creation, production, or delivery of the scripts be liable for any
 damages whatsoever (including, without limitation, damages for loss of business profits, business
 interruption, loss of business information, or other pecuniary loss) arising out of the use of or
 inability to use the sample scripts or documentation, even if Microsoft has been advised of the
 possibility of such damages


