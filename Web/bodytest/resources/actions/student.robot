***Settings***
Documentation               Arquivo para implementação das funcionalidades do cadastro de alunos


***Keywords***

Go To Form Student
    Click                           css=a[href$="alunos/new"]
    Wait For Elements State         xpath=//h1["Novo aluno"]      visible      5

New Student
    [Arguments]         ${name}     ${email}     ${age}      ${weight}       ${feet_tall}

    Fill Text                       xpath=//input[@id="name"]           ${name}
    Fill Text                       xpath=//input[@id="email"]          ${email}
    Fill Text                       xpath=//input[@id="age"]            ${age}
    Fill Text                       xpath=//input[@id="weight"]         ${weight}
    Fill Text                       xpath=//input[@id="feet_tall"]      ${feet_tall}

    Click                           xpath=//button[contains(text(), "Salvar")]