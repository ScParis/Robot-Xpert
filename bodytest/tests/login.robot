***Settings***
Documentation       Suite de testes de Login do Administrador

Resource            ../resources/base.robot

***Test Cases***

Login do Adminstrador

    [tags]              admin

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Login With          admin@bodytest.com          pwd123

    Get Text            css=aside strong      should be   Administrador

    Take Screenshot

Login com senha incorreta

    [tags]              temp

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard
 
    Login With          admin@bodytest.com          acd159

    Wait For Elements State         css=.Toastify__toast-body >> text=Usuário ou senha inválido          visible         5

    Take Screenshot

Login com e-mail inválido

    [tags]              temp

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Login With          admin#bodytest.com          pwd123

    Wait For Elements State         css=form span >> text=Informe um e-mail válido          visible         5

    Take Screenshot

Login com campo senha vazio

    [tags]              temp

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Login With          admin@bodytest.com          ${EMPTY}


    Wait For Elements State         css=form span >> text=A senha é obrigatória          visible         5

    Take Screenshot

Login com campo email vazio

    [tags]              temp

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Login With          ${EMPTY}          pwd123


    Wait For Elements State         css=form span >> text=O e-mail é obrigatório          visible         5

    Take Screenshot


Login sem informar nenhum os campos

    [tags]              temp

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard


    Login With          ${EMPTY}                ${EMPTY}


    Wait For Elements State         css=form span >> text=O e-mail é obrigatório          visible         5
    Wait For Elements State         css=form span >> text=A senha é obrigatória          visible         5

    Take Screenshot

Login com email estranho

    [tags]              temp

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Login With          strangeemailhere                pwd123


    Wait For Elements State         css=form span >> text=Informe um e-mail válido          visible         5

    Take Screenshot