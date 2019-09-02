# Download
$source = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
$destination = "$env:TEMP\firefox.exe"
$WebClient = New-Object System.Net.WebClient
$webclient.DownloadFile($source, $destination)

# Start the installation
Start-Process -Wait -FilePath "$destination\firefox.exe" -ArgumentList "/S"

# Remove the installer
rm -Force $destination

# Pin to taskbar
$sa = New-Object -c Shell.Application
$pn = $sa.Namespace("$env:PROGRAMFILES\Mozilla Firefox").parsename('firefox.exe')
$pn.invokeverb('taskbarpin')
