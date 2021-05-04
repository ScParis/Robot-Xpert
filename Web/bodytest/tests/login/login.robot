***Settings***
Documentation       Suite de testes de Login do Administrador

#Resource            ${EXECDIR}/resources/base.robot
Resource            ../../resources/base.robot

Suite Setup         Start Browser Session

Test Teardown       Take Screenshot

***Test Cases***

Scenery: Administrator login

    [tags]              admin

    Go To Login Page
    Login With                      admin@bodytest.com          pwd123

    User Should Be Logged In        Administrador

    [Teardown]                      Clear Local Storage & Take Screenshot

Scenery: Login with incorrect password

    [tags]              temp

    Go To Login Page 
    Login With                      admin@bodytest.com          acd159

    Toaster Text Should Be          Usuário e/ou senha inválido

    [Teardown]                      Thinking & Take Screenshot      2

Scenery: Login with unregistered email

    [tags]              temp

    Go To Login Page 
    Login With                      user@bodytest.com          pwd123

    Toaster Text Should Be          Usuário e/ou senha inválido

    [Teardown]                      Thinking & Take Screenshot      2

Scenery: Login with invalid email

    [tags]              temp

    Go To Login Page
    Login With                      admin#bodytest.com          pwd123

    Alert Text Should Be            Informe um e-mail válido

Scenery: Login with empty password field

    [tags]              temp

    Go To Login Page
    Login With                      admin@bodytest.com          ${EMPTY}

    Alert Text Should Be            A senha é obrigatória

Scenery: Login with empty email field

    [tags]              temp

    Go To Login Page
    Login With                      ${EMPTY}          pwd123

    Alert Text Should Be            O e-mail é obrigatório

Scenery: Login without informing any fields

    [tags]              temp

    Go To Login Page
    Login With                      ${EMPTY}                ${EMPTY}

    Alert Text Should Be            O e-mail é obrigatório
    Alert Text Should Be            A senha é obrigatória

Scenery: Login with strange email

    [tags]              temp

    Go To Login Page
    Login With                      strangeemailhere                pwd123

    Alert Text Should Be            Informe um e-mail válido