@echo off

for /f "tokens=* delims=/" %%A in ('cd') do set CURRENT_DIR=%%A
SET SHELLDIR=%CURRENT_DIR%/forwin
SET SHELL=%SHELLDIR%/bash.exe
SET BASH=%SHELL%
SET PATH=%SHELLDIR%;%PATH%
cls
"%SHELL%" %SHELLDIR%/wintemizle.sh
pause
