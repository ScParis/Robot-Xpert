***Settings***
Documentation           Ações do menu superior de navegação


***Keywords***

User Should Be Logged In
    [Arguments]         ${user_name}

    Get Text            css=aside strong      should be   ${user_name}

Go To Students Management
    Click                           css=a[href$=alunos]
    Wait For Elements State         xpath=//h1["Gestão de Alunos"]      visible      5