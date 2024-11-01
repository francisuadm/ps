> # Powershell

> > > #### FileBrowser Installer Script then execute it!
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/get_fb.ps1 | iex\"' -Verb RunAs"
```

> #### QR Code generator
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/qrcodemenu.ps1 | iex\"' -Verb RunAs"
```
> #### Remotely Control
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/RemotePC.ps1 | iex\"' -Verb RunAs"
```

> #### Remotely Control 1
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/RemotePC1.ps1 | iex\"' -Verb RunAs"
```

> #### Winget for Windows 10
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/chrome/main/ps/Installer_Winget1.ps1 | iex\"' -Verb RunAs"
```
> #### Display User Folders Remotely0
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/RemovePCUserFolder.ps1 | iex\"' -Verb RunAs"
```

> #### Display User Folders Remotely
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/RemotePCUserFolder.ps1 | iex\"' -Verb RunAs"
```

> #### Run PowerShell command another user account.
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"powershell"' -Verb RunAs"
```

> #### Run PowerShell command runas.
```
runas /noprofile /user:%userdomain%\a-%username% powershell
```
> > ####
```
iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/RemovePCUserFolder.ps1 | iex
```

> > #### My Dailytask for disabling login.
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/refs/heads/main/scripts/dailytask.ps1 | iex\"' -Verb RunAs"
```
> > #### This will capture a Wi-Fi report.
```
netsh wlan show wlanreport
```


>> #### Here are the commands for PSWindowsUpdate with PowerShell: the manual way!

````
# Install the Windows Update module
Install-Module -Name PSWindowsUpdate -Force

# Import the Windows Update module
Import-Module PSWindowsUpdate

# Check for updates
Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Restart the system if updates require a reboot
Restart-Computer -Force
````
