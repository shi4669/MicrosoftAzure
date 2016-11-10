#リソースグループ 
$rg = "AW-RG"
#地域 
$location = "japanwest"
# ストレージ 
$storageAccountName = "simalabmstorageacct"

# 仮想マシンの構成情報 
$vmName = "SQL01"

##VMに空のデータディスクを接続する。
#ターゲットVM構成からVMオブジェクトを作成する。
$vm = Get-AzureRmVM -ResourceGroupName $rg -Name $vmName

#Azureデータディスクを追加する。
$diskLocation = "https://$storageAccountName.blob.core.windows.net/vhds/$vmName-datadisk1.vhd"

Add-AzureRmVMDataDisk -VM $vm -Name $vmName-datadisk1 `
    -VhdUri $diskLocation -LUN 2 -Caching ReadWrite -DiskSizeInGB 1 -CreateOption Empty

#VMを更新する
Update-AzureRmVM -ResourceGroupName $rg -VM $vm