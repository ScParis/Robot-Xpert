***Settings***
Documentation           Ação de componentes genéricos

***Keywords***
Toaster Text Should Be
    [Arguments]                     ${expect_text}

    Wait For Elements State         css=.Toastify__toast-body >> text=${expect_text}          visible         5

Alert Text Should Be

    [Arguments]                     ${expect_text}

    Wait For Elements State         css=form span >> text=${expect_text}          visible         5

Get Required Alerts

    [Arguments]     ${index}

    ${span}         Get Text        xpath=(//form//span)[${index}]

    [return]        ${span} 

Field Should Be Type

    [Arguments]     ${element}              ${type}

    ${attr}        Get Attribute            ${element}      type
    Should Be Equal         ${attr}         ${type}

Register Should Not Be Found

    Wait For Elements State                 css=div >> text=Nenhum registro encontrado.         visible         5
    Wait For Elements State                 css=table           detached                5

Total Itens Should Be
    [Arguments]                     ${number}

    ${element}                      Set Variable                    css=#pagination .total                   

    Wait For Elements State         ${element}          visible         5
    Get Text                        ${element}          ==              Total: ${number}