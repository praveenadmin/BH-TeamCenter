using '../bicep/jumphostvm.bicep'

param vmName = 'jumphostvm'
param location = 'francecentral'
param adminUsername = 'azureadmin'
param vnetName = 'your-existing-vnet-name'
param subnetName = 'your-existing-subnet-name'

param adminPassword
