***Settings***
Documentation       Atualizaçãço de alunos cadastrados

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenery: Update A Student

    ${fixture}          Get Json            students-update.json

    ${kamalakhan}       Set Variable        ${fixture['before']}
    ${msmarvel}         Set Variable        ${fixture['after']}

    Remove Student By Name              ${kamalakhan['name']}
    Remove Student By Name              ${msmarvel['name']}

    Insert Student                      ${kamalakhan}
    
    Go To Students Management
    Search Student By Name              ${kamalakhan['name']}
    Go To Student Update Form           ${kamalakhan['email']}

    Update A Student                    ${msmarvel}

    Toaster Text Should Be              Aluno atualizado com sucesso.

    [Teardown]                          Thinking & Take Screenshot          2
