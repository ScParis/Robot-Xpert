***Settings***
Documentation       Cadastro de alunos

Resource            ../resources/base.robot

Suite Setup         Start Admin Session

Library             Collections

***Test Cases***
New Student

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

Must Not Allow Duplicate Email Registration
    [tags]          dup

    &{student}      Create Dictionary   name=João Teste    email=joao@teste.com   age=18  weight=62   feet_tall=1.52

    Insert Student                 ${student}
# Teste de duplicaidade
#Pré-condição do teste (estar logado no sistema)
    Go To Students Management
    Go To Form Student                                                          # Ação do cenário
    New Student                     &{student}
    
    Toaster Text Should Be          Email já existe no sistema.                 # Validação 

    [Teardown]                      Thinking & Take Screenshot      2

All Fields Must Be Mandatory 

    @{expected_alerts}      Set Variable       Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório        a Altura é obrigatória
    ${got_aperts}           Create List

    Go To Students Management
    Go To Form Student

    Submit Student Form
    
    FOR     ${index}        IN RANGE       1   6
        ${span}     Get Required Alerts         ${index}
        Append To List      ${got_aperts}       ${span}
    END


    Log     ${expected_alerts}
    Log     ${got_aperts}

    Lists Should Be Equal          ${expected_alerts}           ${got_aperts} 

Validate Numbert type

    [tags]          temp
    
    [Template]      Check Type Field On Sudent Form
    
    ${AGE_FIELD}            number
    ${WEIGHT_FIELD}         number
    ${EET_TALL_FEILD}       number

Validate Email Type
    
    [tags]          temp
    
    [Template]      Check Type Field On Sudent Form
    ${EMAIL_FIELD}          email

***Keywords***

Check Type Field On Sudent Form

    [Arguments]         ${element}      ${type}
    
    Go To Students Management
    Go To Form Student

    Field Should Be Type              ${element}          ${type}
