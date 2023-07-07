$MIName = "pullgroupstolatableauth"
$RG = "Name-of-your-Ressource-Group"
$loc = "your-location-eg-westeurope"

Install-Module Az.ManagedServiceIdentity
$miObject = New-AzUserAssignedIdentity -ResourceGroupName $RG -Name $MIName -Location $loc

#Graph
$appId = "00000003-0000-0000-c000-000000000000"
$app = Get-AzureADServicePrincipal -Filter "AppId eq '$appId'"

#Needed Permissions
$permissionsToAdd = "User.Read.All", "UserAuthenticationMethod.Read.All", "GroupMember.Read.All", "Reports.Read.All"

foreach ($permission in $permissionsToAdd)
{
   $role = $app.AppRoles | where Value -Like $permission | Select-Object -First 1
   New-AzureADServiceAppRoleAssignment -Id $role.Id -ObjectId $miObject.PrincipalId -PrincipalId $miObject.PrincipalId -ResourceId $app.ObjectId
}
