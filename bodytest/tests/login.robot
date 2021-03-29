***Settings***
Documentation       Suite de testes de Login do Administrador

Library             Browser

***Test Cases***
Login do Adminstrador

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Fill Text           css=input[name=email]           admin@bodytest.com
    Fill Text           css=input[name=password]        pwd123

    Click               text=Entrar

    Get Text            css=aside strong      should be   Administrador

    Take Screenshot

Login com senha incorreta

    [tags]              temp

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard
    Fill Text           css=input[name=email]           admin@bodytest.com
    Fill Text           css=input[name=password]        abc1212

    Click               text=Entrar

    # Wait For Elements State         css=.Toastify__toast-body      visible      5
    # Get Text                        css=.Toastify__toast-body       should be        Usuário ou senha inválido

    Wait For Elements State         css=.Toastify__toast-body >> text=Usuário ou senha inválido          visible         5

    Take Screenshot

Login com e-mail inválido

    [tags]              wrongemail

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Fill Text           css=input[name=email]           admin$bodytest.com
    Fill Text           css=input[name=password]        pwd123

    Click               text=Entrar

    # Wait For Elements State         css=.Toastify__toast-body      visible      5
    # Get Text                        css=.Toastify__toast-body       should be        Usuário ou senha inválido

    Wait For Elements State         css=form span >> text=Informe um e-mail válido          visible         5

    Take Screenshot

Login com campo senha vazio

    [tags]              emptypass

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Fill Text           css=input[name=email]           admin@bodytest.com
#    Fill Text           css=input[name=password]        pwd123

    Click               text=Entrar

    Wait For Elements State         css=form span >> text=A senha é obrigatória          visible         5

    Take Screenshot

Login sem informar nenhum os campos

    [tags]              emptycredentials

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

#    Fill Text           css=input[name=email]           admin@bodytest.com
#    Fill Text           css=input[name=password]        pwd123

    Click               text=Entrar

    Wait For Elements State         css=form span >> text=Informe um e-mail válido          visible         5
    Wait For Elements State         css=form span >> text=A senha é obrigatória          visible         5

    Take Screenshot

Login com email estranho

        [tags]              strangemail

    New Browser         chromium    False
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Fill Text           css=input[name=email]           strangeemailhere
    Fill Text           css=input[name=password]        pwd123

    Click               text=Entrar

    Wait For Elements State         css=form span >> text=Informe um e-mail válido          visible         5

    Take Screenshot