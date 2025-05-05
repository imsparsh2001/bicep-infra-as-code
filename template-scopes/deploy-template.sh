#!/bin/bash

id=$(az ts show \
  --name artifacts \
  --resource-group bicep-template-rg \
  --version "1.0" \
  --query "id" \
  --output tsv)

az deployment group create \
  --resource-group bicep-template-rg \
  --template-spec $id

echo "Deployment of Template Spec artifacts initiated successfully."
