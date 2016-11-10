# リソースグループ 
$rg = "AW-RG"

# 仮想マシンの情報 
$vmName = "Web01"

# ストレージ
$storageAccountName = "simalabmstorageacct"

# カスタムスクリプト ファイルの情報
$container = "scripts"
$scriptFile = "Install-IIS.ps1"

#ストレージキーの取得方法については、powershellのバージョンによって違うため注意。
#https://blogs.msdn.microsoft.com/windowsazurestorage/2016/08/29/azure-storage-powershell-v-1-7-hotfix-to-v1-4-breaking-changes/

# ストレージ キーを取得 
$key =  (Get-AzureRmStorageAccountKey -Name $storageAccountName -ResourceGroupName $rg)[0].Value
       
# カスタムスクリプトの実行
Set-AzureRmVMCustomScriptExtension -ContainerName $container `
          -FileName $scriptFile -Name $vmName -ResourceGroupName $rg `
          -VMName $vmName -Location $location -Run $scriptFile `
          -StorageAccountKey $key -StorageAccountName $StorageAccountName


