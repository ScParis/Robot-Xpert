Documentation       Cadastro de alunos
***Settings***

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot



Suite Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenario: Exact search

    &{student}      Create Dictionary   name=Theo Moura    email=theomoura@sites.com.br	   age=57  weight=92   feet_tall=1.92

    Remove Student By Name                  ${student.name}
    Insert Student                          ${student}
    Go To Students Management
    Search Student By Name                  ${student.name}
    Student Name Should Be Visible          ${student.name}
    Total Itens Should Be                   1


Scenario: Register Not Found

    ${name}                 Set Variable            Cláudio Marcelo Alves

    Remove Student By Name                  ${name}
    Go To Students Management
    Search Student By Name                  ${name}

Scenario: Search for students by single term

    [tags]              file

    ${fixture}          Get Json            students-search.json
    ${students}         Set Variable        ${fixture['students']}
    ${word}             Set Variable        ${fixture['word']}
    ${total}             Set Variable        ${fixture['total']}

    Remove Student By Name           ${word}


    FOR     ${item}     IN          @{students}

            Insert Student          ${item}

    END

    Go To Students Management
    Search Student By Name          ${word}

    
    FOR     ${item}     IN          @{students}

            Student Name Should Be Visible          ${item['name']}

    END

    Total Itens Should Be                       ${total}
