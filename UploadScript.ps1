# リソースグループ 
$rg = "AW-RG"

# ストレージ 
$storageAccountName = "simalabmstorageacct"

# カスタムスクリプト ファイルの情報
$container = "scripts"
$scriptFile = "c:\Install-IIS.ps1"

#ストレージキーの取得方法については、powershellのバージョンによって違うため注意。
#https://blogs.msdn.microsoft.com/windowsazurestorage/2016/08/29/azure-storage-powershell-v-1-7-hotfix-to-v1-4-breaking-changes/

#ストレージキーの取得
$strorageKey = (Get-AzureRmStorageAccountKey -Name $storageAccountName -ResourceGroupName $rg)[0].Value

# スクリプトのアップロード 
$ctx = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $strorageKey
       
New-AzureStorageContainer -Name $container -Permission Off -Context $ctx
Set-AzureStorageBlobContent -File $scriptFile -Container $container -Context $ctx
 