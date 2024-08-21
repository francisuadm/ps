> # Powershell

> > > #### FileBrowser Installer Script
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/get_fb.ps1 | iex\"' -Verb RunAs"
```

```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/get_fb.ps1 | iex; filebrowser -a 0.0.0.0 -p 8080 -r c:\IT_Folder\"' -Verb RunAs"
```

#### draft one
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"Set-Location -Path C:\IT_Folder; iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/get_fb.ps1 | iex; filebrowser -a 0.0.0.0 -p 8080 -r C:\IT_Folder\"' -Verb RunAs"
```
