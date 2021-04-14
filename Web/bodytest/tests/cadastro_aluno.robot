***Settings***
Documentation       Cadastro de alunos

Resource            ../resources/base.robot
Suite Setup         Start Admin Session


**Test Cases***
Cadastro de alunos

    Remove Student              aluno3@teste.com
#Pré-condição do teste (estar logado no sistema)

    Go To Students Management

# Ação do cenário

    Go To Form Student
    New Student      Aluno3 Teste    aluno3@teste.com    19  92  1.72
    
# Validação 

    Toaster Text Should Be          Aluno cadastrado com sucesso

    [Teardown]                      Thinking & Take Screenshot      2