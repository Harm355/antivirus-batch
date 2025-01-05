@echo off
rem Antivirus Batch Script by Dipsan Dhimal
title Simple Antivirus

echo Welcome to Dipsan Antivirus!
echo Scanning your files for potential threats...
echo.

rem You can define the virus file extensions or keywords here
set virus_exts=.exe .bat .vbs .js .com
set virus_keywords=virus malware trojan

rem Ask the user to input a file name or threat
set /p name=Please enter a file name or potential threat to scan: 

rem Animation function for scanning
setlocal enabledelayedexpansion
set count=0
:animation
set /a count+=1
if !count! leq 3 (
    set dots=!count!
    for /l %%i in (1,1,!dots!) do (
        echo|set /p=.
        timeout /nobreak /t 1 >nul
    )
    echo.
    goto animation
)
endlocal

rem Checking if user input matches dangerous keywords
echo Checking for detected threats...
for %%k in (%virus_keywords%) do (
    echo %name% | findstr /i %%k >nul
    if %errorlevel%==0 (
        echo Threat detected: %name%
        echo Scanning and deleting the file...
        rem Add a directory to delete the specific file if exists
        del "%name%" >nul 2>&1
        echo File deleted: %name%
        goto end_scan
    )
)

rem If no threat is found
echo No threat detected based on your input.

:end_scan
echo Scan complete.
echo Done!
echo.
echo Before exiting, we will check your directory:
echo.
dir /s
pause

echo Enjoy! Bye!
timeout /t 4
exit
