# Source: https://forum.pulseway.com/topic/1940-install-firefox-with-powershell/, credits go to user kavaa and vichra_ben

# Download
$source = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
$destination = "$env:TEMP\firefox.exe"
$WebClient = New-Object System.Net.WebClient
$webclient.DownloadFile($source, $destination)

# Start the installation
Start-Process -Wait -FilePath "$destination\firefox.exe" -ArgumentList "/S"

# Remove the installer
rm -Force $workdir\firefox*
