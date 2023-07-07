$miObject = "object-id-of-your-MI"
$permissionsToAdd = "User.Read.All", "UserAuthenticationMethod.Read.All", "Group.Read.All"

#Graph
$appId = "00000003-0000-0000-c000-000000000000"

Connect-AzureAD
$app = Get-AzureADServicePrincipal -Filter "AppId eq '$appId'"
foreach ($permission in $permissionsToAdd)
{
   $role = $app.AppRoles | where Value -Like $permission | Select-Object -First 1
   New-AzureADServiceAppRoleAssignment -Id $role.Id -ObjectId $miObject -PrincipalId $miObject -ResourceId $app.ObjectId
}