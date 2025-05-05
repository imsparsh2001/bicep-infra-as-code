param storageAccountName string
param storagelocation string
param storageSku object
param storagekind string
param appServiceName string
param appServicePlanName string
param appServicePlanSku object
param resourcelocation string
param virtualMachineName string

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

module virtualNetworkDeployment 'modules/networking /vnet.bicep' = {
  params: {
    location: resourcelocation
    vnetName: '${virtualMachineName}-vnet'
    subnetName: '${virtualMachineName}-subnet'
  }
}

module virtualMachineDeployment 'modules/compute/vm.bicep' = {
  params: {
    virtualMachineName: '${virtualMachineName}-vm'
    location: resourcelocation
    vmSize: 'Standard_B1ms'
    adminUsername: 'azureuser'
    adminPassword: 'P@ssw0rd1234!'
    subnetId: virtualNetworkDeployment.outputs.subnetId
  }
}
