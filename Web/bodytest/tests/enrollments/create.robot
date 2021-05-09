***Settings***
Documentation       Cadastro de alunos

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot


***Test Cases***
Scenery: New Enrollments

    [Tags]              days

    ${fixture}         Get JSON    enrolls-date.json

    ${jessica}                 Set Variable           ${fixture['student']}
    ${Plano_Fit}               Set Variable           ${fixture['plan']}

    Insert Student              ${jessica}
    Insert Plan                 ${Plano_Fit}

    Go To Enrollments Management
    Go To Form Enrollments

    Select Students                 ${jessica['name']}
    Select Plan                     ${Plano_Fit['title']}

    Start Date Should Be Today
    End Date Should Be              ${fixture['days']} 




    # ${code}         Get Page Source
    # Log             ${code}

Scenery: Eroll A Student In A Plan

    [Tags]              days

    ${fixture}         Get JSON    enrolls-create.json

    ${marcos}          Set Variable           ${fixture['student']}
    ${planTop}            Set Variable           ${fixture['plan']}

    Insert Student              ${marcos}
    Insert Plan                 ${planTop}

    Go To Enrollments Management
    Go To Form Enrollments

    Select Students                 ${marcos['name']}
    Select Plan                     ${planTop['title']}

    Submit Form

    [Teardown]                      Thinking & Take Screenshot          5