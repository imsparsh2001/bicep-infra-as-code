using '../main.bicep'

param storageAccountName = 'dev-storageaccount$(uniqueString(resourceGroup().id))'
param resourcelocation = resourceGroup().location
param appServiceName = 'dev-appservice$(uniqueString(resourceGroup().id))'
param enviromentType = 'dev'
