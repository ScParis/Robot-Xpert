***Settings***
Documentation               Arquivo para implementação das funcionalidades do cadastro de matrículas

***Variables***


***Keywords***

## Forms

Select Students

    [Arguments]             ${name}
    
    Fill Text       css=input[aria-label=student_id]            ${name}
    Click           css=div[id*=option] >> text=${name}

Select Plan

    [Arguments]             ${plan}
    
    Fill Text       css=input[aria-label=plan_id]            ${plan}
    Click           css=div[id*=option] >> text=${plan}

## Links & Buttons

Go To Form Enrollments
    Click                           css=a[href$="matriculas/new"]
    Wait For Elements State         xpath=//h1["Nova matrícula"]      visible      5

Submit Form

    Click               css=button[form=formEnrollment]

## Validate

Start Date Should Be Today

    ${start_date}           Get Current Date            result_format=%d/%m/%Y

    Get Attribute           css=input[name=start_date]          value           equal           ${start_date}

End Date Should Be

    [Arguments]             ${days}

    ${current_date}         Get Current Date
    ${end_date}             Add Time To Date        ${current_date}             ${days} Days             result_format=%d/%m/%Y

    Get Attribute           css=input[name=end_date]          value           equal           ${end_date}
