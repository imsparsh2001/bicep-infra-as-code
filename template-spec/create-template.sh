#!/bin/bash

# create command="az ts create"
az ts create \
  --resource-group bicep-template-rg \
  --name artifacts \
  --location westus \
  --display-name "Storage and Webapp" \
  --description "This template spec creates a storage account and app service" \
  --version 1.0 \
  --template-file main.bicep

echo "Template Spec atifacts created successfully."

# update command="az ts update"
az ts update \
  --resource-group bicep-template-rg \
  --name artifacts \
  --version 1.1 \
  --template-file main.bicep

 echo "Template Spec atifacts updated successfully."


# delete command="az ts delete"
az ts delete \
  --resource-group bicep-template-rg \
  --name artifacts \
  --version 1.0
echo "Template Spec atifacts deleted successfully."

# show command="az ts show"  
az ts show \
  --resource-group bicep-template-rg \
  --name artifacts \
  --version 1.0
echo "Template Spec atifacts shown successfully." 

# Export a template spec
az ts export \
  --resource-group MyResourceGroup \
  --name MyTemplateSpec \
  --version 1.0 \
  --output-folder ./mytemplate
 