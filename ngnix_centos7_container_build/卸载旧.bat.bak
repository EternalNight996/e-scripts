@echo off
@title uninstall images and containers

set container=nginx-centos7:1.6.1-v1
set image=nginx-centos7

:REMOVE_CONTAINER
    for /f "delims=" %%i in ('docker ps -a') do (
        echo %%i|find /i "%container%" && echo %%i >> temp.txt || echo "">nul
    )
    for /f "delims= " %%j in ('type temp.txt') do (
        docker stop %%j
        docker rm %%j        
    )
    echo "" > temp.txt

:REMOVE_IMAGE
    for /f "delims=" %%i in ('docker images') do (
        echo %%i|find /i "%image%" && echo %%i >> temp.txt || echo "">nul
    )
    for /f "delims=   " %%j in ('type temp.txt') do (
        echo %%j
        docker rmi %%j
    )

:DONE
    del /f temp.txt
    pause
