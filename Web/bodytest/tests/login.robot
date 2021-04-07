***Settings***
Documentation       Suite de testes de Login do Administrador

Resource            ../resources/base.robot
Suite Setup         Start Browser Session

Test Teardown       Take Screenshot

***Test Cases***

Login do Adminstrador

    [tags]              admin

    Go To Login Page
    Login With                      admin@bodytest.com          pwd123

    User Should Be Logged In        Administrador

    [Teardown]                      Clear Local Storage & Take Screenshot

Login com senha incorreta

    [tags]              temp

    Go To Login Page 
    Login With                      admin@bodytest.com          acd159

    Toaster Text Should Be          Usuário e/ou senha inválido

    [Teardown]                      Thinking & Take Screenshot      2

Login com email não cadastrado

    [tags]              temp

    Go To Login Page 
    Login With                      user@bodytest.com          pwd123

    Toaster Text Should Be          Usuário e/ou senha inválido

    [Teardown]                      Thinking & Take Screenshot      2

Login com e-mail inválido

    [tags]              temp

    Go To Login Page
    Login With                      admin#bodytest.com          pwd123

    Alert Text Should Be            Informe um e-mail válido

Login com campo senha vazio

    [tags]              temp

    Go To Login Page
    Login With                      admin@bodytest.com          ${EMPTY}

    Alert Text Should Be            A senha é obrigatória

Login com campo email vazio

    [tags]              temp

    Go To Login Page
    Login With                      ${EMPTY}          pwd123

    Alert Text Should Be            O e-mail é obrigatório

Login sem informar nenhum os campos

    [tags]              temp

    Go To Login Page
    Login With                      ${EMPTY}                ${EMPTY}

    Alert Text Should Be            O e-mail é obrigatório
    Alert Text Should Be            A senha é obrigatória

Login com email estranho

    [tags]              temp

    Go To Login Page
    Login With                      strangeemailhere                pwd123

    Alert Text Should Be            Informe um e-mail válido