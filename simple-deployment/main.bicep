param storageAccountName string 
param resourcelocation string
param appServiceName string


@allowed(['dev', 'prod'])
param enviromentType string

var appServicePlanName = 'dev-app-service-plan'
var storageAccountSkuName =(enviromentType == 'dev') ? 'Standard_LRS' : 'Standard_GRS'
var appServicPlanSkuName = (enviromentType == 'dev') ? 'S1' : 'P2v3'

resource storageaccount 'Microsoft.Storage/storageAccounts@2024-01-01' ={
  name: storageAccountName
  location: resourcelocation
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  location: resourcelocation
  sku:{
    name: appServicPlanSkuName
    tier: 'Standard'
    capacity: 1
  }
}

resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: appServiceName
  location: resourcelocation
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }

}
