param storageAccountName string 
param storagelocation string
param skuName string 
param storagekind string

resource storageaccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccountName
  location: storagelocation
  sku: {
    name: skuName
  }
  kind: storagekind
  properties: {
    accessTier: 'Hot'
  }
}
