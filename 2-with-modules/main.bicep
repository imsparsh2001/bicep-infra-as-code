param storageAccountName string
param storagelocation string
param skuName string
param storagekind string

module storagemodule './modules/storage/storage.bicep' = {
  name: 'deployStorageAccount'
  params: {
    storageAccountName: storageAccountName
    storagelocation: storagelocation
    skuName: skuName
    storagekind: storagekind
  }
}
