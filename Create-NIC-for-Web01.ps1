#リソースグループ 
$rg = "AW-RG"
#地域 
$location = "japanwest"

# パブリックIPアドレス 
$PublicIpAddressName = "Web01-IP"
$dnsNameforPublicIp = "mylab-we-ps"
$allocationMethod = "Dynamic" 

# 仮想ネットワーク 
$virtualNetworkName = "AW-VNet"
$subnetName = "Frontend-SN"

# NIC
$nicName = "Web01-NIC"
$privateIpAddress = "192.168.1.4"
 
# パブリック IP アドレスの作成 
$pip = New-AzureRmPublicIpAddress `
        -AllocationMethod $allocationMethod -ResourceGroupName $rg `
        -DomainNameLabel $dnsNameforPublicIP `
        -Location $location -Name $PublicIPAddressName 
        
# NICを配置するサブネットの取得 
$vnet = Get-AzureRmVirtualNetwork -Name $virtualNetworkName `
        -ResourceGroupName $rg 
        
$subnet = Get-AzureRmVirtualNetworkSubnetConfig -Name $subnetName `
          -VirtualNetwork $vnet
          
# NICの作成 
$nic = New-AzureRmNetworkInterface -ResourceGroupName $rg `
       -Location $location -Name $nicName -Subnet $subnet `
       -PrivateIpAddress $privateIpAddress -PublicIpAddress $pip