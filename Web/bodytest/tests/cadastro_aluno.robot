***Settings***
Documentation       Cadastro de alunos

Resource            ../resources/base.robot
Suite Setup         Start Browser Session

Test Teardown       Take Screenshot

**Test Cases***
Cadastro de alunos

#Pré-condição do teste (estar logado no sistema)

    Go To Login Page
    Login With                      admin@bodytest.com          pwd123

    User Should Be Logged In        Administrador

    Click                           css=a[href$=alunos]
    Wait For Elements State         xpath=//h1["Gestão de Alunos"]      visible      5

    Click                           css=a[href$="alunos/new"]
    Wait For Elements State         xpath=//h1["Novo aluno"]      visible      5

