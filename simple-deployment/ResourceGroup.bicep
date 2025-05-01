targetScope='subscription'

param resourceGroupName string = 'bicep-dev-eus-rg'
param resourceGroupLocation string = 'eastus'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
