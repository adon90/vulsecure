#Cabecera de aplicación
Write-Host '-------:::VulSecure 0.1 client:::-------'
Write-Host ''
#Información del sistema operativo
$os_major = [System.Environment]::OSVersion.Version.Major
$os_minor = [System.Environment]::OSVersion.Version.Minor
$info = 'OS: Windows   Version: '+ $os_major + '.' + $os_minor
Write-Host 'OPERATING SYSTEM INFO'
Write-Host ''
Write-Host $info
Write-Host ''
Write-Output $info | Out-File .\prueba.txt
#Cabecera Productos
Write-Host 'SOFTWARE PRODUCTS INFO'
Write-Host ''
#Comprobando Mozilla Firefox
Write-Host 'Product: Mozilla Firefox'
Write-Host -NoNewline 'Version: '
(Get-Item 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe').VersionInfo.FileVersion -replace ',','.'
Write-Host ''
#Comprobando Google Chrome
Write-Host 'Product: Google Chrome'
Write-Host -NoNewline 'Version: '
(Get-Item 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe').VersionInfo.FileVersion -replace ',','.'
Write-Host ''
#Comprobando Internet Explorer
Write-Host 'Product: Internet Explorer'
Write-Host -NoNewline 'Version: '
(Get-Item 'C:\Program Files\Internet Explorer\iexplore.exe').VersionInfo.FileVersion -replace ',','.'
Write-Host ''
#Comprobando Adobe Flash
Write-Host 'Product: Adobe Flash'
Write-Host -NoNewline 'Version: '
(Get-Item 'C:\windows\system32\macromed\flash\flash*.exe').VersionInfo.FileVersion -replace ',','.'
Write-Host ''
#Comprobando Adobe Reader
Write-Host 'Product: Adobe Reader'
Write-Host -NoNewline 'Version: '
(Get-Item 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe').VersionInfo.FileVersion -replace ',','.'
Write-Host ''
#Comprobando Java RE
Write-Host 'Product: Java RE'
Write-Host -NoNewline 'Version: '
(Get-Item 'C:\Program Files (x86)\Java\jre1.8.0_31\bin\java.exe').VersionInfo.FileVersion -replace ',','.'
Write-Host ''