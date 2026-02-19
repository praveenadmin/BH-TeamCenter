param storageAccountName string
param location string = 'francecentral'
param skuName string = 'Standard_LRS'
param accessTier string = 'Hot'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: accessTier
  }
}

output storageAccountId string = storageAccount.id
