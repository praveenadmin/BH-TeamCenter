using './vm.bicep'

param location = 'francecentral'
param vmName = 'vmtest2'
param adminUsername = 'azureuser'
param adminPassword = 'Cloudcare@123r'

param existingVnetName = 'testvm-vnet'
param existingSubnetName = 'default'
