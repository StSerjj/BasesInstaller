$user = $env:USERNAME
. "C:\Users\$user\bases_list.ps1"
$target_group_1 = 'config_base_1'
$target_group_2 = 'config_base_2'
$target_group_3 = 'config_base_3'
$ibases_path = "C:\Users\$user\AppData\Roaming\1C\1CEStart\ibases.v8i"
function users_groups {(New-Object System.DirectoryServices.DirectorySearcher("(&(objectCategory=User)(samAccountName=$user))")).FindOne().GetDirectoryEntry().memberOf}
function ibases_create 
{
    switch -wildcard (users_groups)
        {
        "*$target_group_1*" {New-Item -Path "$ibases_path" -Force
                             Add-Content -Path "$ibases_path" "$work_uh `n$alfazup"}
        "*$target_group_2*" {New-Item -Path "$ibases_path" -Force
                             Add-Content -Path "$ibases_path" "$profistaf `n$svoyarabota `n$alfazup"}
        "*$target_group_3*" {New-Item -Path "$ibases_path" -Force
                             Add-Content -Path "$ibases_path" "$bp_all"}
        }
}
ibases_create