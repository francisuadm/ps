# Clear the host display
Clear-Host

# Remove any existing PowerShell sessions
Get-PSSession | Remove-PSSession

# Prompt for the domain and username
$domain = Read-Host "Enter domain"
$username = Read-Host "Enter username"
$fullUsername = "$domain\$username"

# Get credentials securely
$credential = Get-Credential -UserName $fullUsername -Message "Enter password for $fullUsername"

# Run the command with the specified user
Start-Process -FilePath "powershell.exe" -ArgumentList "-Command `"Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command `"powershell`"' -Verb RunAs`"" -Credential $credential

# Display a message requiring admin access on PowerShell ISE
Write-Host "Require Admin access on PowerShell ISE" -ForegroundColor White

# Display a message to prompt for the remote computer's IP and MAC address
Write-Host "To display the remote computer IP and MAC Address:" -ForegroundColor White
Write-Host
Write-Host "[Please enter the ComputerName of the machine:]" -NoNewline -ForegroundColor Green
$computerName = Read-Host
Write-Host

# Use Test-Connection to ping the machine
if (Test-Connection -ComputerName $computerName -Count 1 -Quiet) {
    # If the machine is online, get its IP address
    $ipAddress = [System.Net.Dns]::GetHostAddresses($computerName) | Where-Object { $_.AddressFamily -eq 'InterNetwork' } | Select-Object -ExpandProperty IPAddressToString

    # Display the hostname and IP address
    Write-Host "Hostname: " -ForegroundColor White -NoNewline
    Write-Host "$computerName" -ForegroundColor Green
    Write-Host "IP Address: " -ForegroundColor White -NoNewline
    Write-Host "$ipAddress" -ForegroundColor Green

    # Remote into the machine and get the MAC address
    $macAddress = Invoke-Command -ComputerName $computerName -ScriptBlock {
        Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE | Select-Object -ExpandProperty MACAddress
    }
    Write-Host "MAC Address: " -ForegroundColor White -NoNewline
    Write-Host "$macAddress" -ForegroundColor Green

    # Confirm BIOS version
    $biosVersion = Invoke-Command -ComputerName $computerName -ScriptBlock {
        Get-WmiObject -Class Win32_BIOS | Select-Object -ExpandProperty SMBIOSBIOSVersion
    }
    Write-Host "Current BIOS Version: " -ForegroundColor White -NoNewline
    Write-Host "$biosVersion" -ForegroundColor Green
    Write-Host
    Write-Host "|------------------------------|" -ForegroundColor Cyan

    # Remote into the machine and get the local group members
    $adminGroupMembers = Invoke-Command -ComputerName $computerName -ScriptBlock {
        Get-LocalGroupMember -Name 'Administrators' | Select-Object Name, ObjectClass, PrincipalSource
    }
    Write-Host "Administrators Group Members:" -ForegroundColor White

    # Display the admin group members in a table format
    $adminGroupMembers | Format-Table

    # Wireless INFO
    $WiFi = Invoke-Command -ComputerName $computerName -ScriptBlock {
        Get-NetAdapter -Physical
    }
    $WiFiINFO = $WiFi | Select Name, MacAddress, LinkSpeed, AdminStatus, DriverDescription

    # Display the header in White
    Write-Host "Name         MacAddress               LinkSpeed     Status      DriverDescription" -ForegroundColor White

    # Display each property in a different color
    foreach ($adapter in $WiFiINFO) {
        Write-Host ($adapter.Name + "        ") -NoNewline -ForegroundColor Cyan
        Write-Host ($adapter.MacAddress + "        ") -NoNewline -ForegroundColor Cyan
        Write-Host ($adapter.LinkSpeed + "        ") -NoNewline -ForegroundColor Green
        Write-Host ($adapter.AdminStatus + "        ") -NoNewline -ForegroundColor Blue
        Write-Host ($adapter.DriverDescription) -ForegroundColor Cyan
    }

} else {
    # If the machine is not online, display a message
    Write-Host "System $computerName is currently offline." -ForegroundColor Red
}

# Check if the log folder exists, if not, create it
$logFolderPath = "C:\log"
if (-not (Test-Path -Path $logFolderPath)) {
    New-Item -ItemType Directory -Path $logFolderPath
}

# Log the computer name to the log file
$logFilePath = "$logFolderPath\remote_log.txt"
$logEntry = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $computerName"
Add-Content -Path $logFilePath -Value $logEntry

Write-Host
Write-Host

# Create a new PowerShell session and enter it
$Session = New-PSSession -ComputerName $computerName -ErrorAction SilentlyContinue
Enter-PSSession -Session $Session -ErrorAction SilentlyContinue
