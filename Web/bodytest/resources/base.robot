***Settings***

Documentation           Tudo começa aqui, mwu arquivo base do projeto de automação

Library                 Browser
Library                 libs/DeloreanLibrary.py

Resource                actions/auth.robot
Resource                actions/student.robot

Resource                actions/nav.robot
Resource                actions/components.robot

***Keywords***
Start Browser Session
    New Browser         chromium    False
    New Page            about:blank

Start Admin Session
    Start Browser Session
    Go To Login Page
    Login With                      admin@bodytest.com          pwd123

    User Should Be Logged In        Administrador

Clear Local Storage & Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking & Take Screenshot
    [Arguments]         ${timeout}

    Sleep               ${timeout}
    Take Screenshot