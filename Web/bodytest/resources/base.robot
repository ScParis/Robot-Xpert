***Settings***

Documentation           Tudo começa aqui, mwu arquivo base do projeto de automação

Library                 Browser

Resource                actions/auth.robot
Resource                actions/nav.robot

***Keywords***
Start Browser Session
    New Browser         chromium    False
    New Page            about:blank

Clear Local Storage & Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking & Take Screenshot
    [Arguments]         ${timeout}

    Sleep               ${timeout}
    Take Screenshot