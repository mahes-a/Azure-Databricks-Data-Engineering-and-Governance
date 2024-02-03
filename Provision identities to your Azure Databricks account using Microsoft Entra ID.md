# Configure SCIM Provisioning using Microsoft Entra ID for Azure Databricks

This guide provides step-by-step instructions on how to configure SCIM provisioning using Microsoft Entra ID (formerly Azure Active Directory) for Azure Databricks.You can sync account-level users and groups from your Microsoft Entra ID tenant to Azure Databricks using a SCIM provisioning connector.

## Prerequisites
- Your Azure Databricks account must have the Premium plan.
- You must have the Cloud Application Administrator role in Microsoft Entra ID.
- Your Microsoft Entra ID account must be a Premium edition account to provision groups. Provisioning users is available for any Microsoft Entra ID edition.
- You must be an Azure Databricks account admin.

## 1. Choose the provisioning level
- You can set up provisioning to Azure Databricks using Microsoft Entra ID at the account level or at the workspace level.
- Databricks recommends that you provision users, service principals, and groups to the account level and manage the assignment of users and groups to workspaces within Azure Databricks.
- Your workspaces must be enabled for identity federation, in order to manage the assignment of users to workspaces.
- If you have any workspaces that are not enabled for identity federation, you should continue to provision users, service principals, and groups directly to those workspaces.
- We will provision at a account level

## 2. Generate a SCIM token and URL
- You need a SCIM token and a SCIM URL to configure your Microsoft Entra ID application for provisioning.
- To generate a SCIM token and a SCIM URL for the account level, you must have the Cloud Application Administrator role in Microsoft Entra ID and the account admin role in Azure Databricks.
  
- Log in to the [Azure Databricks account console](https://accounts.azuredatabricks.net/)

- Click Settings =>  User Provisioning =>  Enable user provisioning

  <img width="866" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/82439bf1-476a-4701-8077-78dbe0b51cf1">

  
- Copy the SCIM token and the Account SCIM URL. You will use these to configure your Microsoft Entra ID application.

  <img width="898" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/8ac3014e-8b4a-4a5d-b7e8-d1332af9e515">

  
## 3. Create an enterprise application in Microsoft Entra ID
- In your Azure portal, go to Microsoft Entra ID > Enterprise Applications.
  
  <img width="1199" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/de47be24-59b8-46aa-b125-7d68b8de5ba0">

- Click + New Application above the application list. Under Add from the gallery, search for and select Azure Databricks SCIM Provisioning Connector.

  <img width="728" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/6e3cf948-d0cb-4ef0-b5bc-13bc26dea869">

  - Enter a name for the application and click Add. Use a name that will help administrators find it, like <account-name>-provisioning 

  <img width="425" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/8e2f9b2d-16d1-46ac-ad25-fc3d83cae387">
  
- Under the Manage menu, click Provisioning and click Get Started

  <img width="1169" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/b475f48b-9c13-42f2-9ca4-fbda4b5a6bc7">

- Set Provisioning Mode to Automatic.
- Set the SCIM API endpoint URL to the SCIM URL that you copied earlier.
- Set Secret Token to the Azure Databricks SCIM token that you generated earlier.
- Click Test Connection and wait for the message that confirms that the credentials are authorized to enable provisioning.

  <img width="1193" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/7894646d-cf3f-45c1-865d-6e12ddb17ace">


## 4. Configure the provisioning settings and scope
- Optionally, enter a notification email to receive notifications of critical errors with SCIM provisioning.

  <img width="717" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/999bbeca-5d9f-48b3-a95d-fe6de1bea89f">

- Click "Save"
- Go to Manage > Properties.
- Set Assignment required to No. Databricks recommends this option, which allows all users to sign in to the Azure Databricks account. Click Save

  <img width="588" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/9e214a07-f1db-48a0-a9de-f1c8330f2199">

- Go to Manage > Provisioning.
  
- Click Add user/group, select the users and groups, and click the Assign button.


  <img width="1196" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/299d9c96-a469-42e5-9550-7fc9d0317df0">

  <img width="1045" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/c202c674-c95e-4ed3-a88a-4851962bbf31">



- To start synchronizing Microsoft Entra ID users and groups to Azure Databricks, Go to Overview and Click Start Provisioning.
  <img width="944" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/1a365cc3-c1a3-4ff5-8ebd-d25a418e069c">
  
- Wait a few minutes and check that the users and groups exist in your Azure Databricks account User Management Section.

  

  
