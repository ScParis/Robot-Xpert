***Settings***
Documentation       Cadastro de planos

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenario: New Plan

    [tags]          new

    &{plan}         Create Dictionary           title=Plano Gold           duration=12         price=19,99         total_price=R$ 239,88

    Go To Plans Management
    Go To Form Plans
    
    Fill Plan Form                  ${plan}
    Submit Plan Form

    Toaster Text Should Be          Plano cadastrado com sucesso
    [Teardown]                      Thinking & Take Screenshot      2

Scenario: Calculate The Total Price

    [tags]          total

    &{plan}         Create Dictionary           title=Plano CHK Total           duration=12         price=19,99         total_price=R$ 239,88

    Go To Plans Management
    Go To Form Plans
    Fill Plan Form              ${plan}
    Total PLan Should Be        ${plan.total_price}

Scenario: Validate Required Fields
    [tags]                  req

    @{expected_alerts}      Set Variable       Informe o título do plano      Informe a duração do plano em meses
    ${got_aperts}           Create List

    Go To Plans Management
    Go To Form Plans

    Submit Plan Form
    
    FOR     ${index}        IN RANGE       1   3
        ${span}     Get Required Alerts         ${index}
        Append To List      ${got_aperts}       ${span}
    END


    Log     ${expected_alerts}
    Log     ${got_aperts}

    Lists Should Be Equal          ${expected_alerts}           ${got_aperts} 

Scenario: Validate When Price Is Equals A Zero

    [tags]          zero

    &{plan}         Create Dictionary           title=Plano Price Zero           duration=12         price=0,00         total_price=R$ 239,88

    Go To Plans Management
    Go To Form Plans
    Fill Plan Form              ${plan}

    Submit Plan Form
    
    Toaster Text Should Be          O valor do plano deve ser maior que zero!
    

    [Teardown]                      Thinking & Take Screenshot      2

Scenario: Validate When Price Is Empty

    [tags]          empty

    &{plan}         Create Dictionary           title=Plano Price Empty           duration=12         price=${EMPTY}         total_price=R$ 239,88

    Go To Plans Management
    Go To Form Plans
    Fill Plan Form              ${plan}

    Submit Plan Form
       
    Alert Text Should Be        O preço é obrigatório

    [Teardown]                      Thinking & Take Screenshot      2


Scenario: Validate Duration Less Then 1 Month

    [tags]          less

    &{plan}         Create Dictionary           title=Plano Dur -0           duration=0         price=19,99     total_price=R$ 239,88

    Go To Plans Management
    Go To Form Plans
    Fill Plan Form              ${plan}

    Submit Plan Form
       
    Alert Text Should Be        A duração dever ser no mínimo 1 mês

    [Teardown]                      Thinking & Take Screenshot      2