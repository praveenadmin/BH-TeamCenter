- name: Deploy Bicep Template
  run: |
    az deployment group create \
      --resource-group vm-rg \
      --template-file bicep/vm.bicep \
      --parameters parameters/vm.bicepparam \
                   adminPassword=${{ secrets.VM_ADMIN_PASSWORD }}
