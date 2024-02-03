# Configure SCIM Provisioning using Microsoft Entra ID for Azure Databricks

This guide provides step-by-step instructions on how to configure SCIM provisioning using Microsoft Entra ID (formerly Azure Active Directory) for Azure Databricks.You can sync account-level users and groups from your Microsoft Entra ID tenant to Azure Databricks using a SCIM provisioning connector.

## 1. Choose the provisioning level
- You can set up provisioning to Azure Databricks using Microsoft Entra ID at the account level or at the workspace level.
- Databricks recommends that you provision users, service principals, and groups to the account level and manage the assignment of users and groups to workspaces within Azure Databricks.
- Your workspaces must be enabled for identity federation, in order to manage the assignment of users to workspaces.
- If you have any workspaces that are not enabled for identity federation, you should continue to provision users, service principals, and groups directly to those workspaces.

## 2. Generate a SCIM token and URL
- You need a SCIM token and a SCIM URL to configure your Microsoft Entra ID application for provisioning.
- To generate a SCIM token and a SCIM URL for the account level, you must have the Cloud Application Administrator role in Microsoft Entra ID and the account admin role in Azure Databricks.
- To generate a SCIM token and a SCIM URL for the workspace level, you must have the Cloud Application Administrator role in Microsoft Entra ID and the workspace admin role in Azure Databricks.
- Log in to the Azure Databricks account console or the Azure Databricks workspace, and copy the SCIM token and the SCIM URL.

## 3. Create an enterprise application in Microsoft Entra ID
- In your Azure portal, go to Microsoft Entra ID > Enterprise Applications.
- Click + New Application above the application list. Under Add from the gallery, search for and select Azure Databricks SCIM Provisioning Connector.
- Enter a name for the application and click Add. Use a name that will help administrators find it, like <account-name>-provisioning or <workspace-name>-provisioning.
- Set the SCIM API endpoint URL to the SCIM URL that you copied earlier.
- Set Secret Token to the Azure Databricks SCIM token that you generated earlier.
- Click Test Connection and wait for the message that confirms that the credentials are authorized to enable provisioning.

## 4. Configure the provisioning settings and scope
- Optionally, enter a notification email to receive notifications of critical errors with SCIM provisioning.
- Set Assignment required to Yes or No, depending on whether you want to sync only users and groups assigned to the enterprise application or all users.
- To start synchronizing Microsoft Entra ID users and groups to Azure Databricks, set the Provisioning Status toggle to On.
- Click Add user/group, select the users and groups, and click the Assign button.
- Wait a few minutes and check that the users and groups exist in your Azure Databricks account or workspace.
