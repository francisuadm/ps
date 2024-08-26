> # Powershell

> > > #### FileBrowser Installer Script then execute it!
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/get_fb.ps1 | iex\"' -Verb RunAs"
```

> #### QR Code generator
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/qrcodemenu.ps1 | iex\"' -Verb RunAs"
```
