param storageAccountName string
param storagelocation string
param storageSku object
param storagekind string
param appServiceName string
param appServicePlanName string
param appServicePlanSku object
param resourcelocation string

module storageAccountDeployment 'modules/storage/storage.bicep' = {
  params: {
    storageAccountName: storageAccountName
    storageSku: storageSku
    storagekind: storagekind
    storagelocation: storagelocation
  }
}

module appServiceDeployment 'modules/compute/app.bicep' = {
  params: {
    appServiceName: appServiceName
    appServicePlanName: appServicePlanName
    appServicePlanSku: appServicePlanSku
    resourcelocation: resourcelocation
  }
}

