***Settings***
Library     hello.py

***Test Cases***
Deve retornar mensagem de boas vindas
    ${resultado}=       Hello Robot         Scherman Paris
    Should Be Equal     ${resultado}        Olá, Scherman Paris.