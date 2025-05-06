param resourcelocation string = resourceGroup().location
param storageAccountName string = 'bistorage'
param storageAccountSkuName string = 'Standard_LRS'
// param appServicePlanName string = 'bicep-app-service-plan'
// param appServicPlanSkuName string = 'S1'
// param appServiceName string = 'bicep-app-service'

// resource storageaccount 'Microsoft.Storage/storageAccounts@2024-01-01' ={
//     name: '${storageAccountName}${uniqueString(resourceGroup().name)}'
//   location: resourcelocation
//   sku: {
//     name: storageAccountSkuName
//   }
//   kind: 'StorageV2'
//   properties: {
//     accessTier: 'Hot'
//   }
// }

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

// Use a template spec as a Bicep module
module storageAccountTemplateSpec 'ts:757e50a8-70c0-4191-b649-8dca5d05c669/bicep-template-rg/artifacts:1.0' = {
  name: 'storageAccountTemplateSpec'
  params: {
    storageAccountName: storageAccountName
    storageAccountSkuName: storageAccountSkuName
    resourcelocation: resourcelocation
  }
}
