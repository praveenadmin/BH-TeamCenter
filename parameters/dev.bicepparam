using '../bicep/storage.bicep'

param storageAccountName = 'praveenstoragedev01'
param location = 'eastus'
param skuName = 'Standard_LRS'
param accessTier = 'Hot'


using '../bicep/vm.bicep'

param vmName = 'winvmgithub01'
param adminUsername = 'azureuser'
param adminPassword = 'Cloudcare@123r'
