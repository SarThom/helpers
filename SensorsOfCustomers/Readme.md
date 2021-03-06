# SensorsOfCustomersWithoutNotifications.ps1

This script will generate a list of all sensors without notifications. The script will look at all customers visible to the user used to authenticate against the Server-Eye API.

This script supports login via API key and via username and password. 

## PowerShell Helper Module
This script needs the Server-Eye Powershell helper. Please see https://github.com/Server-Eye/helpers/blob/master/ServerEye.Powershell.Helper/readme.md for details on how to install this module.

## Download

You can download the helper script with following powershell command:
```
iwr "https://raw.githubusercontent.com/Server-Eye/helpers/master/SensorsOfCustomers/SensorsOfCustomersWithoutNotifications.ps1" -OutFile SensorsOfCustomersWithoutNotifications.ps1
```

## Execute
There are several ways to run this script. 

### With an API Key
```powershell
SensorsOfCustomersWithoutNotifications.ps1 -ApiKey yourApiKey 
```

### Via Login
```powershell
Connect-SESession | SensorsOfCustomersWithoutNotifications.ps1
```

## Output
The output is a standard PowerShell table and can be processed with any compatible cmdlet. The most common option is to create a Excel sheet. 
```powershell
# You only need to install the module once.
Install-Module -Name ImportExcel -Scope CurrentUser

# Show all sensors without a notification and save the result as Excel sheet
Connect-SESession | SensorsOfCustomersWithoutNotifications.ps1 | Export-Excel -Path "noNotification.xlsx" -Show
```


# SensorsOfCustomersWithNotifications.ps1

This script will generate a list of all sensors with notifications. The script will look at all customers visible to the user used to authenticate against the Server-Eye API.

This script supports login via API key and via username and password. 

## Download

You can download the helper script with following powershell command:
```
iwr "https://raw.githubusercontent.com/Server-Eye/helpers/master/SensorsOfCustomers/SensorsOfCustomersWithNotifications.ps1" -OutFile SensorsOfCustomersWithNotifications.ps1
```

## Execute
There are several ways to run this script. 

### With an API Key
```powershell
SensorsOfCustomersWithNotifications.ps1 -ApiKey yourApiKey 
```

### Via Login
```powershell
Connect-SESession | SensorsOfCustomersWithNotifications.ps1
```

## Output
The output is a standard PowerShell table and can be processed with any compatible cmdlet. The most common option is to create a Excel sheet. 
```powershell
# You only need to install the module once.
Install-Module -Name ImportExcel -Scope CurrentUser

# Show all sensors with a notification and save the result as Excel sheet
Connect-SESession | SensorsOfCustomersWithNotifications.ps1 | Export-Excel -Path "withNotification.xlsx" -Show
```
