***Settings***
Documentation       Remover planos

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Test Setup          Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenery: Remove A Registered Plan

    &{plan}         Create Dictionary           title=Master Plan I         duration=60             price=36.90

    Remove Plan By Title            ${plan.title}
    Insert Plan                     ${plan}

    Go To Plans Management
    Search Plan By Title            ${plan.title}
    Request Removal By Title        ${plan.title}
    Confirm Removal

    Toaster Text Should Be          Plano removido com sucesso
    Plan Should Not Be Visible      ${plan.title}

    [Teardown]                          Thinking & Take Screenshot      2

Scenary: Cancel Remove A Registered Plan

        &{plan}         Create Dictionary           title=Plus Plan I         duration=60             price=36.90

        Insert Plan                 ${plan}

        Go To Plans Management
        Search Plan By Title        ${plan.title}
        Request Removal By Title    ${plan.title}
        Cancel Removal              
        Plan Should Be Visible      ${plan.title}
