***Settings***

Documentation           Tudo começa aqui, mwu arquivo base do projeto de automação

Library                 Browser
Library                 OperatingSystem
Library                 Collections
Library                 DateTime

Library                 libs/DeloreanLibrary.py

Resource                actions/auth.robot
Resource                actions/enrollments.robot
Resource                actions/plans.robot
Resource                actions/student.robot

Resource                actions/nav.robot
Resource                actions/components.robot

***Keywords***
Start Browser Session
    New Browser         chromium    True
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


### Helpers

Get Json

    [Arguments]         ${file_name}

    ${file}=            Get File            Web/bodytest/resources/fixtures/${file_name}
    ${json_object}      Evaluate            json.loads($file)           json

    [return]            ${json_object}
