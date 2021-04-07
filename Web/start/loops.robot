***Settings***
Documentation           Laços de repetição (Loops)

Library                 Collections

***Variables***

@{AVENGERS}         Hulk        Thor        IronMan         CapitãoAmerica
@{JUSTICE}          Superman    Worder Woman    Batman      Arrow

***Test Cases***

Meu Primeiro Loop

    ${crossover}        Combine Lists               ${AVENGERS}     ${JUSTICE}

    FOR     ${item}     IN      @{crossover}

        IF      $item == 'IronMan'

            Log To Console     Obtendo o vingador: ${item}

        END

    END

Outro Loop

    [tags]          Batman

    ${crossover}        Combine Lists               ${AVENGERS}     ${JUSTICE}

    FOR     ${item}     IN      @{crossover}

        Exit For Loop If     $item == 'Thor'
        Log To Console     Obtendo o vingador: ${item}

    END