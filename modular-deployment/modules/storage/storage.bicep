param storageAccountName string 
param storagelocation string
param storageSku object  
param storagekind string

resource storageaccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccountName
  location: storagelocation
  sku: {
    name: storageSku.name 
  }
  kind: storagekind
  properties: {
    accessTier: 'Hot'
  }
}
