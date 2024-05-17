@echo off
setlocal EnableDelayedExpansion
set ver=0.1
set c=curl -g -k -L -# -o

cd /d "%~dp0"

title VorteX display-drivers-uninstaller %ver%


REM Get video controller name
for /f "skip=1 delims=" %%a in ('wmic path win32_VideoController get name') do (
    set "placaF=%%a"
    set "placaF=!placaF:~0,-1!" REM Remove trailing carriage return
    goto :next
)

:next
echo Video controller: !placaF!

REM Driver uninstallation based on detected video controller
set "vendor="
if /i "!placaF:~0,6!"=="NVIDIA" (
    set "vendor=NVIDIA"
) else if /i "!placaF:~0,3!"=="AMD" (
    set "vendor=AMD"
) else if /i "!placaF:~0,5!"=="Intel" (
    set "vendor=Intel"
)

if defined vendor (
    echo Uninstalling !vendor! drivers...
 bcdedit /deletevalue {current} safeboot
 bcdedit /deletevalue {current} safebootalternateshell
    start "" "%~dp0\ddu.exe" -Silent -NoRestorePoint -PreventWinUpdate -NoSafeModeMsg -Clean!vendor! -Restart 
    
) else (
    echo Unknown video controller: !placaF!
)

pause