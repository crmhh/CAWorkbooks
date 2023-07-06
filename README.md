# CAWorkbooks
## Strong Authentication Dashboard
A granular dashboard can easy be deployed to a customer environment needing a Logic App and a Workbook. For a detailed overview see this [blogpost](https://chris-brumm.medium.com/implementing-an-advanced-authentication-methods-dashboard-bcb83ebbef95) 

### Step 1: Deploy Logic App

[![deploy2azure.png](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcrmhh%2FCAWorkbooks%2Fmain%2FStrongAuthDashboard-LogicApp.arm.json)

 <img src="https://github.com/crmhh/CAWorkbooks/assets/30894952/c34d2dc9-d8a7-48cc-a25c-e2ad02f51050" alt="alt text" width="350" height="350">

### Step 2: Grant Permission to the Managed Identity of the LA:

https://gist.github.com/crmhh/11d2b4a7dd1c598d63f4ee3f0f7bd833#file-assignlamipems-ps1

### Step 3: Deploy Workbook

[![deploy2azure.png](https://github.com/crmhh/CAWorkbooks/assets/30894952/f47a0916-d2fb-403f-8435-ea0f39483718)](https://portal.azure.com/#create/Microsoft.Template/uri/https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcrmhh%2FCAWorkbooks%2Fmain%2FStrongAuthDashboard.arm.json)
