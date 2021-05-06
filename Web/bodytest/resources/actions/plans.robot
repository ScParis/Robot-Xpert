***Settings***
Documentation               Arquivo para implementação das funcionalidades do cadastro de planos

***Variables***

${TITLE_FIELD}               xpath=//input[@id="title"]     
${DURATION_FIELD}            xpath=//input[@id="duration"]    
${PRICE_FIELD}               xpath=//input[@name="price"]      
${TOTAL_FIELD}               xpath=//input[@name="total"]   

***Keywords***

## Form

Submit Plan Form
    Click               xpath=//button[contains(text(), "Salvar")]

Fill Plan Form
    [Arguments]         ${plan}

    Fill Text           ${TITLE_FIELD}           ${plan.title}
    Fill Text           ${DURATION_FIELD}        ${plan.duration}
    Fill Text           ${PRICE_FIELD}           ${plan.price}


## Links & Buttons

Go To Form Plans
    Click                           css=a[href$="planos/new"]
    Wait For Elements State         xpath=//h1["Novo plano"]      visible      5


## Validations

Total Plan Should Be
    [Arguments]         ${total}

    Get Attribute       ${TOTAL_FIELD}          value       ==          ${total}

Search Plan By Title

    [Arguments]                 ${title}

    Fill Text                   css=input[placeholder="Buscar plano"]               ${title}

Plan Title Should Be Visible

    [Arguments]                     ${title}

    Wait For Elements State         css=table tbody tr >> text=${title}          visible         7

Go To Plan Update Form

    [Arguments]         ${title}

    Click                               xpath=//td[contains(text(), "${title}")]/..//a[@class="edit"]
    Wait For Elements State             css=h1 >> text=Edição de plano          visible         5

Update A Plan

    [Arguments]         ${plan}

    Fill Text           ${TITLE_FIELD}               ${plan['title']}
    Fill Text           ${DURATION_FIELD}            ${plan['duration']}
    Fill Text           ${PRICE_FIELD}               ${plan['price']}

    Submit Plan Form

Request Removal By Title

    [Arguments]         ${title}

    Click               xpath=//td[contains(text(), "${title}")]/../td/button[@id="trash"]

Plan Should Not Be Visible

    [Arguments]                 ${title}

    Wait For Elements State         xpath=//td[contains(text(), "${title}")]        detached            5

Plan Should Be Visible

    [Arguments]                 ${title}

    Wait For Elements State         xpath=//td[contains(text(), "${title}")]        visible            5