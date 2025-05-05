@description('The name of the storage account.')
@minLength(3)
param storageAccountName string
// param storageAccountName1 string = '${storageAccountName}${uniqueString(resourceGroup().id)}'

@description('The location where the resources will be deployed.')
// @allowed(['East US', 'West US', 'Central US', 'North Europe', 'West Europe'])
param resourcelocation string = resourceGroup().location

// @description('The name of the app service.')
// param appServiceName string

@allowed(['dev', 'prod'])
param enviromentType string

// @secure()
// @description('The administrator login username for the SQL server.')
// param sqlServerAdministratorLogin string
 
// @secure()
// @description('The administrator login password for the SQL server.')
// param sqlServerAdministratorPassword string

// @description('The name and tier of the SQL database SKU.')
// param sqlDatabaseSku object

// var appServicePlanName = 'dev-app-service-plan'
var storageAccountSkuName =(enviromentType == 'dev') ? 'Standard_LRS' : 'Standard_GRS'
// var appServicPlanSkuName = (enviromentType == 'dev') ? 'S1' : 'P2v3'
// var sqlServerName = '${enviromentType}-sql'
// var sqlDatabaseName = 'Employees'

resource storageaccount 'Microsoft.Storage/storageAccounts@2024-01-01' ={
  // name: storageAccountName
  name: '${storageAccountName}${uniqueString(resourceGroup().name)}'
  location: resourcelocation
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

// resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
//   name: appServicePlanName
//   location: resourcelocation
//   sku:{
//     name: appServicPlanSkuName
//     tier: 'Standard'
//     capacity: 1
//   }
// }

// resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
//   name: appServiceName
//   location: resourcelocation
//   properties: {
//     serverFarmId: appServicePlan.id
//     httpsOnly: true
//   }

// }


// resource sqlServer 'Microsoft.Sql/servers@2024-05-01-preview'    = {
//   name: sqlServerName
//   location: resourcelocation
//   properties: {
//     administratorLogin: sqlServerAdministratorLogin
//     administratorLoginPassword: sqlServerAdministratorPassword
//   }
// }

// resource sqlDatabase 'Microsoft.Sql/servers/databases@2024-05-01-preview' = {
//   parent: sqlServer
//   name: sqlDatabaseName
//   location: resourcelocation
//   sku: {
//     name: sqlDatabaseSku.name
//     tier: sqlDatabaseSku.tier
//   }
// }
