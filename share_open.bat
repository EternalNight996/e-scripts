@echo off
@REM Create connection of share
title CONNECTION SHARE

set password=""
set username=guest
set host=192.168.80.4
set path=¹«¹²¹²ÏíÅÌ

@REM network connection target
C:\Windows\System32\net.exe use \\%host%\%path% /user:%username% %password%

@REM open file of network share
C:\Windows\explorer.exe \\%host%\%path%

@REM delete connected of network share
@REM net use \\%host%%path% /delete
pause