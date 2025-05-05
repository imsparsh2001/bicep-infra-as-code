param appServicePlanName string
param resourcelocation string
param appServicePlanSku object
param appServiceName string


resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  location: resourcelocation
  sku: {
    name: appServicePlanSku.name  
    tier: appServicePlanSku.tier  
    capacity: appServicePlanSku.capacity 
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

