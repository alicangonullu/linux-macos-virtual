runas /user:Administrator cmd
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
@echo off

for /f "tokens=* delims=/" %%A in ('cd') do set CURRENT_DIR=%%A
SET SHELLDIR=%CURRENT_DIR%/forwin
SET SHELL=%SHELLDIR%/bash.exe
SET BASH=%SHELL%
SET PATH=%SHELLDIR%;%PATH%
cls
"%SHELL%" %SHELLDIR%/winbasla.sh
pause