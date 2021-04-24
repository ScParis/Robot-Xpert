***Settings***
Documentation               Arquivo para implementação das funcionalidades do cadastro de alunos

***Variables***

${NAME_FIELD}               xpath=//input[@id="name"]     
${EMAIL_FIELD}              xpath=//input[@id="email"]    
${AGE_FIELD}                xpath=//input[@id="age"]      
${WEIGHT_FIELD}             xpath=//input[@id="weight"]   
${EET_TALL_FEILD}           xpath=//input[@id="feet_tall"]


***Keywords***

Go To Form Student
    Click                           css=a[href$="alunos/new"]
    Wait For Elements State         xpath=//h1["Novo aluno"]      visible      5

Submit Student Form
    Click               xpath=//button[contains(text(), "Salvar")]

New Student
    [Arguments]         &{student}

    Fill Text           ${NAME_FIELD}          ${student.name}
    Fill Text           ${EMAIL_FIELD}         ${student.email}
    Fill Text           ${AGE_FIELD}           ${student.age}
    Fill Text           ${WEIGHT_FIELD}        ${student.weight}
    Fill Text           ${EET_TALL_FEILD}      ${student.feet_tall}

    Submit Student Form