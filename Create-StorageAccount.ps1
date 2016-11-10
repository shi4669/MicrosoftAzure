#リソースグループ 
$rg = "AW-RG" 
#地域 
$location = "japanwest" 
# ストレージ アカウント 
$newStorageAccountName = "simalabmstorageacct"
$storageAccountType = "Standard_LRS" 
 
New-AzureRmStorageAccount -Location $location ` -Name $newStorageAccountName -ResourceGroupName $rg -Type $storageAccountType