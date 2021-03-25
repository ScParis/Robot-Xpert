***Settings***
Documentation           Conhecendo as Listas

Library                 Collections

***Variables***
@{AVENGERS}         Hulk        Thor        IronMan         CapitãoAmerica
@{JUSTICE}          Superman    Worder Woman    Batman      Arrow

***Test Cases***
Minha Lista

    # ${index}        Get Index From List        ${AVENGERS}         IronMan

    # Log To Console          ${index}
    # Set List Value          ${AVENGERS}         ${index}            Homem de Ferro

    # ${remover}      Get Index From List         ${AVENGERS}         Thor
    
    # Remove From List        ${AVENGERS}         ${remover}

    # Log To Console          ${AVENGERS}


    ${crossover}        Combine Lists               ${AVENGERS}     ${JUSTICE}

    Log To Console      ${crossover}

    ${total}            Count Values In List        ${crossover}      Thor

    Log To Console      ${total}

    ${sort}             Sort List                   ${crossover}
