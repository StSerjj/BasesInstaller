$work_uh = '[work_uh]
Connect=Srvr="10.4.13.125";Ref="work_uh";
ID=1ebfc70f-7513-422f-9059-78db3f4fc890
OrderInList=16384
Folder=/
OrderInTree=256
External=0
ClientConnectionSpeed=Normal
App=Auto
WA=1
Version=8.3'
$alfazup = '[alfazup]
Connect=Srvr="10.4.13.125";Ref="alfazup";
ID=b80b8ef9-7f08-4c3b-8073-a910754a4b0f
OrderInList=16640
Folder=/
OrderInTree=16640
External=0
ClientConnectionSpeed=Normal
App=Auto
WA=1
Version=8.3'
$profistaf = '[profistaf]
Connect=Srvr="10.4.13.125";Ref="profistaf";
ID=90e6d252-388a-42ea-a0a6-58b4f67a3753
OrderInList=127
Folder=/
OrderInTree=33024
External=0
ClientConnectionSpeed=Normal
App=Auto
WA=1
Version=8.3'
$svoyarabota = '[svoyarabota]
Connect=Srvr="10.4.13.125";Ref="svoyarabota";
ID=cb859e2a-b0f0-4145-8fa3-168b5eb10a5c
OrderInList=383
Folder=/
OrderInTree=49408
External=0
ClientConnectionSpeed=Normal
App=Auto
WA=1
Version=8.3'
$bp_all = '[bp_all]
Connect=Srvr="10.4.13.125";Ref="bp_all";
ID=47f8ba4b-283b-439e-825f-e853e62f3d69
OrderInList=16767
Folder=/
OrderInTree=256
External=0
ClientConnectionSpeed=Normal
App=Auto
WA=1
Version=8.3'
$user = $env:USERNAME
$target_group_1 = 'CN=config_base_1,OU=Группы доступа к базам 1С,OU=Группы,OU=BESIX,DC=besix,DC=local'
$target_group_2 = 'CN=config_base_2,OU=Группы доступа к базам 1С,OU=Группы,OU=BESIX,DC=besix,DC=local'
$target_group_3 = 'CN=config_base_3,OU=Группы доступа к базам 1С,OU=Группы,OU=BESIX,DC=besix,DC=local'
$users_groups = (New-Object System.DirectoryServices.DirectorySearcher("(&(objectCategory=User)(samAccountName=$user))")).FindOne().GetDirectoryEntry().memberOf
If ($users_groups -contains $target_group_1) 
{
    New-Item -Path "C:\Users\$user\AppData\Roaming\1C\1CEStart\ibases.v8i" -Force
    Add-Content -Path "C:\Users\$user\AppData\Roaming\1C\1CEStart\ibases.v8i" "$work_uh `n$alfazup"

} 
elseif ($users_groups -contains $target_group_2)
{
    New-Item -Path "C:\Users\$user\AppData\Roaming\1C\1CEStart\ibases.v8i" -Force
    Add-Content -Path "C:\Users\$user\AppData\Roaming\1C\1CEStart\ibases.v8i" "$profistaf `n$svoyarabota `n$alfazup"
}
elseif ($users_groups -contains $target_group_3)
{
    New-Item -Path "C:\Users\$user\AppData\Roaming\1C\1CEStart\ibases.v8i" -Force
    Add-Content -Path "C:\Users\$user\AppData\Roaming\1C\1CEStart\ibases.v8i" "$bp_all"
}
else {
#        echo "Не выбран конфиг базы 1С для $user"
}