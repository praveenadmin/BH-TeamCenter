param vmName string
param storageAccountName string
param location string = resourceGroup().location

// Create UAMI
resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'uami-vm-storage'
  location: location
}

// Existing VM
resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' existing = {
  name: vmName
}

// Update VM identity
resource vmIdentity 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vm.name
  location: francecentral
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${uami.id}': {}
    }
  }
}

// Existing Storage
resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

// RBAC Role Assignment
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(storage.id, uami.id, 'blob-role')
  scope: storage
  properties: {
    principalId: uami.properties.principalId
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      'ba92f5b4-2d11-453d-a403-e96b0029c9fe' // Storage Blob Data Contributor
    )
  }
}
