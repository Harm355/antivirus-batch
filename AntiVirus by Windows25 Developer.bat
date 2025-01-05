@echo off
title Antivirus Virus
cls
Echo Hello Do You Scan PC?
Echo Please Enter Name
Pause
Cls
set /p name=
Echo Scanning...
Pause
Cls
Dir/s
Cls
:infected
Echo Warning Virus Detected!!
Pause
Cls
if exist %name% //a
Echo Deleting...
Pause
Cls
:Del
Del %name%
Echo Enjoy Your PC!!
Pause
Cls
Exit