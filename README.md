# CAWorkbooks
## Strong Authentication Dashboard
A granular dashboard can easy be deployed to a customer environment needing a Logic App and a Workbook. For a detailed overview see this [blogpost](https://chris-brumm.medium.com/implementing-an-advanced-authentication-methods-dashboard-bcb83ebbef95) 

![Overview Auth Method Dashboard](/media/OverviewAuthMethodDashboard.png)
![Auth Method Dashboard](/media/AuthMethodDashboard.png)

The solution consists of a Logic App and a Workbook for AAD.

### Step 1: Deploy Logic App

The first step is to deploy the Logic App to your favorite location in your Azure environment.

[![deploy2azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcrmhh%2FCAWorkbooks%2Fmain%2Fconfig%2Fdeploy%2FStrongAuthDashboard-LogicApp.arm.json)

For the deployment you will need some infos from your Log Analytics Workspace:
* The name of your Log Analytics Workspace
* The ID of your Log Analytics Workspace
* The name of the Resource Group of your Log Analytics Workspace
* The ID of the Subscription of your Log Analytics Workspace
* A key for your Log Analytics Workspace

You will find all of them in the overview page of your LAWS - except the key that is in the Agents section. 

Since the dashboard is working on specific AAD groups you are asked to provide the object ID of your first group in addition. It is reasonable to use dynamic groups containing your enabled, real users. 

<img src="https://github.com/crmhh/CAWorkbooks/assets/30894952/c34d2dc9-d8a7-48cc-a25c-e2ad02f51050" alt="alt text" width="350" height="350">

### Step 2: Grant Permission to the Managed Identity of the LA:

The Logic App will be deployed in a disabled state and you should grant permissions to the already enabled Managed Identity before you enable it. The needed permissions are:
* User.Read.All
* UserAuthenticationMethod.Read.All
* Group.Read.All

You can do this easy with Powershell. Here is a [sample script](/config/deploy/StrongAuthDashboardAssignPerms.ps1)
After the assignment of the permissions you can enable the Logic App and the first run will automatically start.

### Step 3: Deploy Workbook

[![deploy2azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcrmhh%2FCAWorkbooks%2Fmain%2Fconfig%2Fdeploy%2FStrongAuthDashboard.arm.json)

<img src="/media/CustomDeploymentWorkbook.png" alt="alt text" width="350">
