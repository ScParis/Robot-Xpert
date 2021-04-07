***Settings***
Documentation       Trabalhando com condicionais


***Test Cases***

Carteira de Motorista
    ${idade}=       Set Variable        18

    IF      ${idade} >= 18
        Log To Console      Você pode tirar sua CNH
    ELSE
        Log To Console      Você deve andar de bicicleta até atingir a idade mínima para tirar a CNH
    END

Navegador
    [tags]          browser
    ${browser}=         Set Variable        Firefox

    IF              '${browser}' == 'Firefox'
        Log To Console      Chamando o ${browser}
    ELSE IF         '${browser}' == 'Chrome'
        Log To Console      Chamando o ${browser}
    ELSE IF         '${browser}' == 'Webkit'
        Log To Console      Chamando o ${browser}
    ELSE
        Fail      Navegador incorreto
    END
