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

    New Browser         chromium    True
    New Page            https://bodytest-web-scparis.herokuapp.com/dashboard

    Fill Text           css=input[name=email]           admin@bodytest.com
    Fill Text           css=input[name=password]        abc1212

    Click               text=Entrar

    Wait For Elements State         css=.Toastify__toast-body      visible      5
    Get Text                        css=.Toastify__toast-body       should be        Usuário ou senha inválido

    Take Screenshot

#    