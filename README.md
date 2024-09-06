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
Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File "C:\path\to\RemotePC1.ps1"' -Verb RunAs
```
