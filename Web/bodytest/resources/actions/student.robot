***Settings***
Documentation               Arquivo para implementação das funcionalidades do cadastro de alunos

***Variables***

${NAME_FIELD}               xpath=//input[@id="name"]     
${EMAIL_FIELD}              xpath=//input[@id="email"]    
${AGE_FIELD}                xpath=//input[@id="age"]      
${WEIGHT_FIELD}             xpath=//input[@id="weight"]   
${FEET_TALL_FEILD}          xpath=//input[@id="feet_tall"]


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
    Fill Text           ${FEET_TALL_FEILD}     ${student.feet_tall}

    Submit Student Form

Request Removal by Email

    [Arguments]         ${email}

    Click               xpath=//td[contains(text(), "${email}")]/../td/button[@id="trash"]

Confirm Removal

    Click               text=SIM, pode apagar!

Cancel Removal

    Click               text=NÃO


Student Should Not Be Visible

    [Arguments]                 ${email}

    Wait For Elements State         xpath=//td[contains(text(), "${email}")]        detached            5

Student Should Be Visible

    [Arguments]                 ${email}

    Wait For Elements State         xpath=//td[contains(text(), "${email}")]        visible            5

Search Student By Name

    [Arguments]                 ${name}

    Fill Text                   css=input[placeholder="Buscar aluno"]               ${name}

Student Name Should Be Visible

    [Arguments]                     ${name}

    Wait For Elements State         css=table tbody tr >> text=${name}          visible         5

Go To Student Update Form

    [Arguments]         ${email}

    Click                               xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait For Elements State             css=h1 >> text=Edição de aluno          visible         5

Update A Student

    [Arguments]         ${student}

    Fill Text           ${NAME_FIELD}               ${student['name']}
    Fill Text           ${EMAIL_FIELD}              ${student['email']}
    Fill Text           ${AGE_FIELD}                ${student['age']}
    Fill Text           ${WEIGHT_FIELD}             ${student['weight']}
    Fill Text           ${FEET_TALL_FEILD}          ${student['feet_tall']}

    Submit Student Form