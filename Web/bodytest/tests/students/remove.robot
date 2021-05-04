***Settings***
Documentation       Remover alunos

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Test Setup          Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenery: Remove A Registered Student

    &{student}      Create Dictionary   name=Bruno Antonio Almeida    email=brunoantonioalmeida@bernardino.co   age=18  weight=62   feet_tall=1.52

    Insert Student                      ${student}

    Go To Students Management
    Search Student By Name              ${student.name}
    Request Removal by Email            ${student.email}
    Confirm Removal

    Toaster Text Should Be              Aluno removido com sucesso.
    Student Should Not Be Visible       ${student.email}

    [Teardown]                          Thinking & Take Screenshot      2

Scenery: Cancel Remove A Registered Student

    &{student}      Create Dictionary   name=Edson Alexandre Figueiredo    email=eedsonalexandrefigueiredo@way2goidiomas.com.br   age=38  weight=62   feet_tall=1.52

    Insert Student                      ${student}

    Go To Students Management
    Search Student By Name              ${student.name}
    Request Removal by Email            ${student.email}
    Cancel Removal
    Student Should Be Visible           ${student.email}