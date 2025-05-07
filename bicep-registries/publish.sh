az bicep publish \
  --file website.bicep \
  --target 'br:bicepmoduleregistry0192.azurecr.io/website:v1'

az bicep publish \
  --file cdn.bicep \
  --target 'br:bicepmoduleregistry0192.azurecr.io/cdn:v1'