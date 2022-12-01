@description('Location for all resources.')
param location string = resourceGroup().location

module storage 'storage.bicep' = {
  name: 'storageAccountName'
  params: {
    location: location
      
  }
}

// return the name
output name string = storage.outputs.name
output bloburl string = storage.outputs.bloburl
output key string = storage.outputs.key

module webservervm 'VMcreation.bicep' = {
  name: 'VMname'
  param :{
    location :location

  }
}
