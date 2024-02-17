# Access data shared with you using Delta Sharing for recipients

## Read shared data using open sharing connectors for non-databricks use cases

### create a recipient and share the activation link

- From the Azure Databricks workspace Open Catalog -> Delta Sharing

    <img width="465" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/7895c4bb-e5a8-44cf-99fc-1c4998f86080">

- Open the quickstart_share_1 created in the previous step 
   <img width="51" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/b87b3f6a-c446-442f-8def-551db88037db">

- Click Recipients -> Add Recipients
  <img width="551" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/83a17c48-7fd0-449e-b44a-c2e6c5d493e5">

- Enter the Recipient details by clicking Create new recipient in the dropdown , Since the recipient is a non databricks recipient leave the Sharing identifier empty and add the Recipient

    <img width="515" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/d7d84314-1d5b-476d-987e-bc63de9b8ccf">

    <img width="485" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/221d5803-e5d6-4916-9b47-04fcf3596b20">

    <img width="488" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/7fd23c91-3334-4357-a88e-48d7513cd581">

- Copy the Activation link for Recipient non-databricks recipient and share it with the non-databricks recipient in a secure way

  <img width="518" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/bb59f01e-feb2-46e1-b199-882841013aa9">

###  Recipient Read the shared data 

- As a Recipient download the Credential file , This credential file can only be downloaded once , Open the credential file and note down the endpoint and bearerToken

  <img width="870" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/828b0693-c98e-47af-a7e1-956f26bd0de0">

- We will use Power BI desktop to connect and read the shared data
  
- Open a new report and click Get Data -> Delta sharing

  <img width="545" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/d079b253-8334-4a89-89ad-29baeb752a2c">

- Enter the url and credential to connect to delta share and read the data from the share
    <img width="535" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/28f5237c-9bf2-438c-a29c-20ec0f2e588c">

## Read shared data using open sharing connectors for databricks users

### create a recipient using the metastore details 

- Find the databricks identifier for the recipient by finding the unique identifier using the SELECT CURRENT_METASTORE();

   <img width="438" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/f99d0175-f864-4b8d-9485-6e52fe213a96">

  
- Open the quickstart_share_1 created in the previous step 
   <img width="51" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/b87b3f6a-c446-442f-8def-551db88037db">

- Click Recipients -> Add Recipients
  <img width="551" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/83a17c48-7fd0-449e-b44a-c2e6c5d493e5">

- Enter the Recipient details by clicking Create new recipient in the dropdown , Since the recipient is a databricks recipient enter the metastore unique identifier of the recipient

   <img width="501" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/b48be298-fd4a-4e20-a00d-2b16dcff1e4a">

###  Recipient Read the shared data 

- As the Databricks Recipient who was shared the data , login into  the Azure Databricks workspace Open Catalog -> Delta Sharing
  
- Click shared with me and open the shared provider details and acess the share and create a catalog and read the shared data

   <img width="796" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/ec799cd1-09dc-46c5-b429-dfd77e4bf226">

  <img width="485" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/9d5bd75d-4f6f-4ce3-8069-f92eede065ad">

   <img width="730" alt="image" src="https://github.com/mahes-a/Azure-Databricks-Data-Engineering-and-Governance/assets/120069348/d8e7b6d2-c54f-427e-8dc1-de835374e2e6">







  



