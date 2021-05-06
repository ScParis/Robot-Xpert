***Settings***
Documentation       Atualizaçãço de planos cadastrados

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenery: Update A Plan

    ${fixture}          Get Json            plans-update.json

    ${AnualPlat}        Set Variable        ${fixture['before']}
    ${platinum}         Set Variable        ${fixture['after']}

    Remove Plan By Title                ${AnualPlat['title']}
    Remove Plan By Title                ${platinum['title']}

    Insert Plan                         ${AnualPlat}
    
    Go To Plans Management
    Search Plan By Title                ${AnualPlat['title']}
    Go To Plan Update Form              ${AnualPlat['title']}

    Update A Plan                       ${platinum}

    Toaster Text Should Be              Plano Atualizado com sucesso

    [Teardown]                          Thinking & Take Screenshot          2
