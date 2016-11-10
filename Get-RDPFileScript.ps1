
# リソースグループ 
$rg = "AW-RG"
$VMs = Get-AzureRmVM -ResourceGroupName $rg

foreach ($VM in $VMs)
{
    $FileName= $VM.Name + ".rdp"
    Get-AzureRmRemoteDesktopFile -ResourceGroupName $rg -Name $VM.Name -LocalPath C:\Users\Yukio\Desktop\SetUp\Azure\$FileName
     
}