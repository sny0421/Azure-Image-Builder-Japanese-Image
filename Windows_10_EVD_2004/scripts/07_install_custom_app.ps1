$tempFolder = "C:\Temp"

# Visual Studio Code
$vsCodeUrl = "https://go.microsoft.com/fwlink/?Linkid=852157"
$vsCodeLocalPath = $tempFolder + "\vsCode.exe"
$wc.Downloadfile($vsCodeUrl, $vsCodeLocalPath)
Start-Process -FilePath $vsCodeLocalPath -Wait -ArgumentList "/VERYSILENT /MERGETASKS=!runcode"

# Chromium Edge
$edgeUrl = "http://dl.delivery.mp.microsoft.com/filestreamingservice/files/789ec525-0feb-4d62-a24b-99fd15d117e4/MicrosoftEdgeEnterpriseX64.msi"
$edgeLocalPath = $tempFolder + "\edge_install.exe"
$wc.Downloadfile($edgeUrl, $edgeLocalPath)
start /wait msiexec.exe /i $edgeLocalPath /passive 

New-Item -Path "C:\StartLayout" -ItemType Directory
Move-Item "C:\Temp\layout.xml" "C:\StartLayout\layout.xml"
# Set Start Layout
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer!LockedStartLayout HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "StartLayoutFile" /t REG_SZ /d "C:\StartLayout\layout.xml" /f

# Clean up temporary folder
Remove-Item -Path $tempFolder -Recurse
