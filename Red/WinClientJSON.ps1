$ErrorActionPreference = "Stop"
#Inicio JSON
Write-Host '{'
Write-Host '"Products":['
#Información del sistema operativo
Try {
    $os_major = [System.Environment]::OSVersion.Version.Major
    $os_minor = [System.Environment]::OSVersion.Version.Minor
    $info = 'OS: Windows   Version: '+ $os_major + '.' + $os_minor
    Write-Host '{"vendor": "Microsoft", "product": "Windows", "version": "'$os_major'.'$os_minor'"},'
} Catch {
    Write-Host '{"vendor": "Microsoft", "product": "Windows", "version": "not-installed",'
}
#Comprobando Mozilla Firefox
Try {
    $version = (Get-Item 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe').VersionInfo.FileVersion -replace ',','.'
    Write-Host '{"vendor": "Mozilla", "product": "Firefox", "version": "'$version'"},'
} Catch {
    Write-Host '{"vendor": "Mozilla", "product": "Firefox", "version": "not-intalled",'
}
#Comprobando Google Chrome
Try {
    $version = (Get-Item 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe').VersionInfo.FileVersion -replace ',','.'
    Write-Host '{"vendor": "Google", "product": "Chrome", "version": "'$version'"},'
} Catch {
    Write-Host '{"vendor": "Google", "product": "Chrome", "version": "not-installed",'
}
#Comprobando Internet Explorer
Try {
    $version = (Get-Item 'C:\Program Files\Internet Explorer\iexplore.exe').VersionInfo.FileVersion -replace ',','.'
    Write-Host '{"vendor": "Microsoft", "product": "Internet Explorer", "version": "'$version'"},'
} Catch {
    Write-Host '{"vendor": "Microsoft", "product": "Internet Explorer", "version": "not-installed",'
}
#Comprobando Adobe Flash
Try {
    $version = (Get-Item 'C:\windows\system32\macromed\flash\flash*.exe').VersionInfo.FileVersion -replace ',','.'
    Write-Host '{"vendor": "Adobe", "product": "Flash", "version": "'$version'"},'
} Catch {
    Write-Host '{"vendor": "Adobe", "product": "Flash", "version": "not-installed",'
}
#Comprobando Adobe Reader
Try {
    $version = (Get-Item 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe').VersionInfo.FileVersion -replace ',','.'
    Write-Host '{"vendor": "Adobe", "product": "Reader", "version": "'$version'"},'
} Catch {
    Write-Host '{"vendor": "Adobe", "product": "Reader", "version": "not-installed",'
}
#Comprobando Java RE
Try {
    $version = (Get-Item 'C:\Program Files (x86)\Java\jre1.8.0_31\bin\java.exe').VersionInfo.FileVersion -replace ',','.'
    Write-Host '{"vendor": "Oracle", "product": "Java RE", "version": "'$version'"}'
} Catch {
    Write-Host '{"vendor": "Oracle", "product": "Java RE", "version": "not-installed"'
}
#Final JSON
Write-Host ']'
Write-Host -NoNewline '}'