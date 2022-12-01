param storageName string
param location string = resourceGroup().location
resource exampleStorage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
output name string = exampleStorage.name
