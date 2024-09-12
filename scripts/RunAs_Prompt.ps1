# Prompt for the domain and username
$credential = (Get-Credential)

# Run the command with the specified user
Start-Process -FilePath "powershell.exe" -ArgumentList "-Command `"Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command `"powershell`"' -Verb RunAs`"" -Credential $credential
