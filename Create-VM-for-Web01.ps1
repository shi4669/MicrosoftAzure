﻿# リソースグループ 
$rg = "AW-RG"

# 地域 
$location = "japanwest"

# 仮想マシンの構成情報 
$vmName = "Web01"
$vmSize = "Standard_A1"

# 仮想マシン イメージの情報 
$publisher = "MicrosoftWindowsServer"
$offer = "WindowsServer"
$sku = "2012-R2-Datacenter"
$version = "latest"

# OS ディスクの情報 
$StorageAccountName = "simalabmstorageacct"
$caching = "ReadWrite"
$createOption = "fromImage"
$vhdUri = "https://$StorageAccountName.blob.core.windows.net/vhds/$vmName-os.vhd"

# NIC の情報 
$nicName = "Web01-NIC" 
 
# NIC の情報を取得 
$nic = Get-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $rg

# 仮想マシンの管理者アカウント情報を取得 
$cred = Get-Credential

# 仮想マシンの構成情報を作成 
$config = New-AzureRmVMConfig -VMName $vmName -VMSize $vmSize | Set-AzureRmVMOperatingSystem -Windows -ComputerName $vmName `
           -Credential $cred -ProvisionVMAgent -EnableAutoUpdate | Set-AzureRmVMSourceImage -PublisherName $publisher `
           -Offer $offer -Skus $sku -Version $version | Set-AzureRmVMOSDisk -Name "$vmName" -VhdUri $vhdUri `
           -Caching $caching -CreateOption $createOption |Add-AzureRmVMNetworkInterface -Id $nic.Id
           
#  仮想マシンの作成 
New-AzureRmVM -ResourceGroupName $rg -Location $location -VM $config 