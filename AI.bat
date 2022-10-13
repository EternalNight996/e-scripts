@ECHO OFF
set NOW=%time:~6,2%

if "%NOW%" LSS "10" (
    goto :robot
)
:main
    color 5
    
    echo *****hello welcome to my chat room*****
    echo *****here is SB AI club.. just chat your robot*****
    echo *****(robot¡¢ clear¡¢ robot chat)
    set /p input="please input robot or other:  "
    if "%input%" == "robot" (
        goto :robot
    ) else if "%input%" == "clear" (
        echo try to cleaning all of robot
        del /f robot*  
    ) else if "%input%" == "robot chat" (
        goto :chat
    ) else (
        goto finished
    )

:robot
    timeout 1 >nul
    echo @ECHO OFF >robot%NOW%.bat
    echo set NOW=%time:~6,2%+1 >>robot%NOW%.bat
    echo echo i am robot%NOW%. >>robot%NOW%.bat

    echo COPY robot%NOW%.bat robot%NOW%copy.bat >>robot%NOW%.bat
    echo call AI.bat >>robot%NOW%.bat
    call robot%NOW%.bat
    goto :main

:chat
    timeout 1 >nul
    echo @ECHO OFF >robot%NOW%.bat
    echo set NOW=%time:~6,2%+1 >>robot%NOW%.bat
    echo echo i am robot%NOW%.  >>robot%NOW%.bat
    echo echo what's your name?  >>robot%NOW%.bat
    echo set /p name="" >>robot%NOW%.bat
    echo echo nice to see you. >>robot%NOW%.bat 
    echo COPY robot%NOW%.bat robot%NOW%copy.bat >>robot%NOW%.bat
    echo call AI.bat >>robot%NOW%.bat
    call robot%NOW%.bat
    goto :main

:finished
    color 6
    timeout 1 >nul
    color 7
    timeout 1 >nul
    color 5
    timeout 1 >nul
    color 7
    timeout 1 >nul
    color 1

    echo thanks for your come here.
    del /f robot*
    pause >nul
    exit