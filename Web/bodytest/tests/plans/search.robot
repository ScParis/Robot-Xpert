***Settings***
Documentation       Pesquisa de planos


#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot



Suite Setup         Start Admin Session
Test Teardown       Take Screenshot             


***Test Cases***
Scenario: Plan Exact Search

    [tags]          exact

    &{plan}         Create Dictionary           title=Plano Exact           duration=12         price=19.99         total_price=R$ 239.88

    Remove Plan By Title                ${plan.title}
    Insert Plan                         ${plan}
    
    Go To Plans Management
    Search Plan By Title                ${plan.title}
    Plan Title Should Be Visible        ${plan.title}
    Total Itens Should Be                   1

Scenario: Register Not Found

    ${title}                 Set Variable            Plano Not Found

    Remove Plan By Title                  ${title}
    Go To Plans Management
    Search Plan By Title                  ${title}
    [Teardown]                      Thinking & Take Screenshot      2

Scenario: Search for Plan by Single Term

    [tags]              file

    ${fixture}          Get Json            plans-search.json
    ${plans}            Set Variable        ${fixture['plans']}
    ${word}             Set Variable        ${fixture['word']}
    ${total}            Set Variable        ${fixture['total']}

    Remove Plan By Title           ${word}


    FOR     ${item}     IN              @{plans}

            Insert Plan          ${item}

    END

    Go To Plans Management
    Search Plan By Title          ${word}

    
    FOR     ${item}     IN          @{plans}

            Plan Title Should Be Visible          ${item['title']}

    END

    Total Itens Should Be                       ${total}