# Define parameters
$resourceGroupName = "<resource-group-name>"
$deploymentName = "<deployment-name>"
$templateFilePath = "<path-to-your-arm.json>"
$storageAccountName = "<storage-account-name>"

# Create a resource group if it doesn't exist
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    New-AzResourceGroup -Name $resourceGroupName -Location "<location>"
}

# Define template and parameter object
$templateObject = @{
    "storageAccountName" = $storageAccountName
}

# Deploy ARM template
New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath -TemplateParameterObject $templateObject