@echo off
:: Basit Kurulum Scripti - v1.0
echo GitHub Projem Kurulumu

:: Parametre kontrolü
if [%1]==[] (
    echo Kullanım: kurulum.bat <kullanıcı_adı>
    exit /b 1
)

set KULLANICI=%1

:: ZIP dosyasını indirme
echo [*] Proje dosyaları indiriliyor...
powershell -Command "$wc = New-Object System.Net.WebClient; $wc.DownloadFile('http://github.com/wexomhub3334/xd/archive/refs/heads/main.zip', '%TEMP%\proje.zip')"
if errorlevel 1 (
    echo [!] İndirme başarısız!
    exit /b 1
)

:: ZIP dosyasını açma
echo [*] Dosyalar açılıyor...
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('%TEMP%\proje.zip', '%USERPROFILE%\proje')"
if errorlevel 1 (
    echo [!] Açma işlemi başarısız!
    exit /b 1
)

:: Kurulum tamam
echo [*] Kurulum tamamlandı! Dosyalar şurada: %USERPROFILE%\proje
pause