***Settings***
Documentation       Cadastro de alunos

Resource            ../resources/base.robot
Suite Setup         Start Admin Session


***Test Cases***
Novo aluno

    &{student}      Create Dictionary   name=Aluno Teste    email=aluno@teste.com   age=38  weight=92   feet_tall=1.72

    Remove Student                  ${student.email}

#Pré-condição do teste (estar logado no sistema)
    Go To Students Management

# Ação do cenário
    Go To Form Student
    New Student                     &{student}
    
# Validação 
    Toaster Text Should Be          Aluno cadastrado com sucesso

    [Teardown]                      Thinking & Take Screenshot      2

Não Deve Permitir Cadastro De Email Duplicado
    [tags]          dup


    &{student}      Create Dictionary   name=João Teste    email=joao@teste.com   age=18  weight=62   feet_tall=1.52

    Inserir Student                 ${student}

# Teste de duplicaidade
#Pré-condição do teste (estar logado no sistema)
    Go To Students Management

# Ação do cenário
    Go To Form Student
    New Student                     ${student}
    
# Validação 
    Toaster Text Should Be          Email já existe no sistema.

    [Teardown]                      Thinking & Take Screenshot      2
