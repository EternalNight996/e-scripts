@echo off
@REM Create connection of share
title CONNECTION SHARE

set host=192.168.80.4
set path=¹«¹²¹²ÏíÅÌ

@REM delete connected of network share
C:\Windows\System32\net.exe use \\%host%\%path% /delete

pause