#Comprobando Mozilla Firefox
Write-Output -NoNewline 'Mozilla Firefox:   '
(Get-Item 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe').VersionInfo.FileVersion -replace ',','.'
#Comprobando Google Chrome
Write-Output -NoNewline 'Google Chrome:     '
(Get-Item 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe').VersionInfo.FileVersion -replace ',','.'
#Comprobando Internet Explorer
Write-Output -NoNewline 'Internet Explorer: '
(Get-Item 'C:\Program Files\Internet Explorer\iexplore.exe').VersionInfo.FileVersion -replace ',','.'
#Comprobando Adobe Flash
Write-Output -NoNewline 'Adobe Flash:       '
(Get-Item 'C:\windows\system32\macromed\flash\flash*.exe').VersionInfo.FileVersion -replace ',','.'
#Comprobando Adobe Reader
Write-Output -NoNewline 'Adobe Reader:      '
(Get-Item 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe').VersionInfo.FileVersion -replace ',','.'
#Comprobando Java RE
Write-Output -NoNewline 'Java RE:           '
(Get-Item 'C:\Program Files (x86)\Java\jre1.8.0_31\bin\java.exe').VersionInfo.FileVersion -replace ',','.'
#Comprobando Windows
$os_major = [System.Environment]::OSVersion.Version.Major
$os_minor = [System.Environment]::OSVersion.Version.Minor
Write-Output 'Windows:          '$os_major'.'$os_minor