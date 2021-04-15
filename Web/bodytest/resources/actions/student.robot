***Settings***
Documentation               Arquivo para implementação das funcionalidades do cadastro de alunos


***Keywords***

Go To Form Student
    Click                           css=a[href$="alunos/new"]
    Wait For Elements State         xpath=//h1["Novo aluno"]      visible      5

New Student
    [Arguments]         &{student}

    Fill Text           xpath=//input[@id="name"]           ${student.name}
    Fill Text           xpath=//input[@id="email"]          ${student.email}
    Fill Text           xpath=//input[@id="age"]            ${student.age}
    Fill Text           xpath=//input[@id="weight"]         ${student.weight}
    Fill Text           xpath=//input[@id="feet_tall"]      ${student.feet_tall}

    Click               xpath=//button[contains(text(), "Salvar")]