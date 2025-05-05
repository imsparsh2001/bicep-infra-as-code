#!/bin/bash

az ts create \
  --resource-group bicep-template-rg \
  --name artifacts \
  --location westus \
  --display-name "Storage and Webapp" \
  --description "This template spec creates a storage account and app service" \
  --version 1.0 \
  --template-file main.bicep

echo "Template Spec atifacts created successfully."
