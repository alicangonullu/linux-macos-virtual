@echo off

for /f "tokens=* delims=/" %%A in ('cd') do set CURRENT_DIR=%%A
set MACVERSION = "-c"
SET SHELLDIR=%CURRENT_DIR%/forwin
SET SHELL=%SHELLDIR%/bash.exe
SET BASH=%SHELL%
SET PATH=%SHELLDIR%;%PATH%

echo " -y, --yardim        Yardım."
echo " -s, --high-sierra   High Sierra Kurulumu."
echo " -m, --mojave        Mojave Kurulumu."
echo " -c, --catalina      Catalina Kurulumu."
"%SHELL%" %SHELLDIR%/wininstall.sh %MACVERSION%
pause
