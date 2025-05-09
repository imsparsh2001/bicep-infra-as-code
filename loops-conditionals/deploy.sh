#!/bin/bash

resourceGroupName="bicep-resource"  
templateFile="conditional.bicep"  
deploymentName="deployment-$(date +'%Y%m%d%H%M%S')"

az group show --name $resourceGroupName > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Resource group $resourceGroupName does not exist. Please create it manually."
else
  echo "Resource group $resourceGroupName already exists."
  
  echo "Deploying Bicep template..."

  az deployment group create \
    --name $deploymentName \
    --resource-group $resourceGroupName \
    --template-file $templateFile \
    

  if [ $? -eq 0 ]; then
    echo "Deployment successful!"
  else
    echo "Deployment failed!"
  fi
fi
