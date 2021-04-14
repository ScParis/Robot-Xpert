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

    Go To Students Management

# Ação do cenário

    New Student      Aluno3 Teste    aluno3@teste.com    19  92  1.72
    
# Validação 

    Toaster Text Should Be          Aluno cadastrado com sucesso

    [Teardown]                      Thinking & Take Screenshot      2