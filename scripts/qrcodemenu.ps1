# Check if QRCodeGenerator module is installed
if (-not (Get-Module QRCodeGenerator -ListAvailable)) {
    # Install the module if not found
    Write-Host "Installing QRCodeGenerator module..."
    Install-Module -Name QRCodeGenerator
}

# Check if execution policy is set to Unrestricted
$currentPolicy = Get-ExecutionPolicy

if ($currentPolicy -ne 'Unrestricted') {
    # Set execution policy to Unrestricted if not set
    Write-Host "Setting execution policy to Unrestricted..."
    Set-ExecutionPolicy Unrestricted -Scope Process
}

# Import the QRCodeGenerator module
Import-Module QRCodeGenerator

# Create a menu for user selection
while ($true) {
    Write-Host "Select an option:"
    Write-Host "1. Generate WiFi QR Code"
    Write-Host "2. Generate Text QR Code"
    Write-Host "3. Generate vCard QR Code"
    Write-Host "4. Generate URL QR Code"
    Write-Host "0. Exit"

    $choice = Read-Host "Enter your choice:"

    switch ($choice) {
        1 {
            # Get WiFi parameters from user
            $ssid = Read-Host "Enter SSID:"
            $password = Read-Host "Enter password:"
            $security = Read-Host "Enter security type (e.g., WPA2-PSK):"

            # Generate WiFi QR code and show on screen
            New-QRCodeWifiAccess -SSID $ssid -Password $password -Security $security -Show
        }
        2 {
            # Get text from user
            $text = Read-Host "Enter text:"

            # Generate text QR code and show on screen
            New-QRCodeText -Text $text -Show
        }
        3 {
            # Get vCard information from user
            $name = Read-Host "Enter name:"
            $organization = Read-Host "Enter organization:"
            $title = Read-Host "Enter title:"
            $email = Read-Host "Enter email:"
            $phone = Read-Host "Enter phone number:"

            # Generate vCard QR code and show on screen
            New-QRCodeVCard -Name $name -Organization $organization -Title $title -Email $email -Phone $phone -Show
        }
        4 {
            # Get URL from user
            $url = Read-Host "Enter URL:"

            # Generate URL QR code and show on screen
            New-QRCodeURI -URI $url -Show
        }
        0 {
            Write-Host "Exiting..."
            break;  # Explicitly break out of the while loop
        }
        default {
            Write-Host "Invalid choice. Please try again."
        }
    }
}
