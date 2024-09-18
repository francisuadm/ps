### Manage the Print Spooler service and clear the print job queue
```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/ps/main/scripts/resetPrinterSpooler.ps1 | iex\"' -Verb RunAs"
```
