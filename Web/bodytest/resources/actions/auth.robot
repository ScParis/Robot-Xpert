***Settings***
Documentation     Ações de autorização


***Keywords***
Go To Login Page

    Go To               https://bodytest-web-scparis.herokuapp.com/dashboard 


Login With

    [Arguments]         ${email}            ${pass}

    # Fill Text           css=input[name=email]           ${email}
    # Fill Text           css=input[placeholder*=senha]        ${pass}

    Fill Text           input[name=email]           ${email}
    Fill Text           input[placeholder*=senha]        ${pass}

    Click               text=Entrar

Logout Session

    Click               xpath=//span[contains(text(), "Sair")]

