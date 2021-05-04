***Settings***
Documentation       Cadastro de alunos

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenery: New Student

    &{student}      Create Dictionary   name=Fábio José Martin Nascimento    email=ffabiojosemartinnascimento@cenia.com.br   age=38  weight=92   feet_tall=1.72

    Remove Student                  ${student.email}

#Pré-condição do teste (estar logado no sistema)
    Go To Students Management

# Ação do cenário
    Go To Form Student
    New Student                     &{student}
    
# Validação 
    Toaster Text Should Be          Aluno cadastrado com sucesso

    [Teardown]                      Thinking & Take Screenshot      2

Scenery: Must Not Allow Duplicate Email Registration
    [tags]          dup

    &{student}      Create Dictionary   name=Juan Severino Porto    email=juanseverinoporto@hotmai.com.br   age=18  weight=62   feet_tall=1.52

    Insert Student                 ${student}

#    Log To Console                  ${student}
# Teste de duplicaidade
#Pré-condição do teste (estar logado no sistema)
    Go To Students Management
    Go To Form Student                                                          # Ação do cenário
    New Student                     &{student}
    
    Toaster Text Should Be          Email já existe no sistema.                 # Validação 

    [Teardown]                      Thinking & Take Screenshot      2

Scenery: All Fields Must Be Mandatory 

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

Scenery: Validate Numbert type

    [tags]          temp
    
    [Template]      Check Type Field On Sudent Form
    
    ${AGE_FIELD}            number
    ${WEIGHT_FIELD}         number
    ${EET_TALL_FEILD}       number

Scenery: Validate Email Type
    
    [tags]          temp
    
    [Template]      Check Type Field On Sudent Form
    ${EMAIL_FIELD}          email

Scenery: Under 14 years old cannot register
    
    &{student}      Create Dictionary   name=Alana Emilly Pires    email=aalanaemillypires@indaiamidias.com.br   age=13  weight=55   feet_tall=1.62

    Go To Students Management
    Go To Form Student                                                          # Ação do cenário
    New Student                     &{student}

    Alert Text Should Be            A idade deve ser maior ou igual 14 anos



***Keywords***

Check Type Field On Sudent Form

    [Arguments]         ${element}      ${type}
    
    Go To Students Management
    Go To Form Student

    Field Should Be Type              ${element}          ${type}

