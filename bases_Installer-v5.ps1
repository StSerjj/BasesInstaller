$user = $env:USERNAME
. "C:\Users\$user\bases_list.ps1"
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