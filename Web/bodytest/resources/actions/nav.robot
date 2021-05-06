***Settings***
Documentation           Ações do menu superior de navegação


***Keywords***
Go To Students Management
    Click                           css=a[href$=alunos]
    Wait For Elements State         xpath=//h1["Gestão de Alunos"]      visible      5

Go To Plans Management
    Click                       css=a[href$=planos]
    Wait For Elements State     css=h1 >> text=Gestão de Planos     visible     5

User Should Be Logged In
    [Arguments]         ${user_name}

    Get Text            css=aside strong      should be   ${user_name}