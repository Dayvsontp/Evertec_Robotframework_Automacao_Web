*** Settings ***

Resource    ../functions/Constants.resource
Resource    ../functions/Utils.resource

*** Variables ***

${url}               https://blogdoagi.com.br/
${lupa}              //a[@aria-label='Search button'] 
${searchID}          //input[@type='search']
${SETA_CARROUSEL}    css:button[type='button'].slick-prev

*** Keywords ***

Acessar URL
    [Arguments]    ${url}
    Go To    ${url}

Validar blog acessado 
    [Arguments]    ${lupa}    ${timeout}=10s
    Espere o elemento estar visivel    ${lupa}    ${timeout}
    
    
Pesquisar no blog
    [Arguments]    ${termo}    ${tentativa}=1

    Press Keys    xpath=//body    DOWN

    ${VISIVEL}    Run Keyword And Return Status    Espere o elemento estar visivel    ${SETA_CARROUSEL}    5s

    IF    ${VISIVEL}
        Execute Javascript    document.querySelector('a[aria-label="Search button"]').click()
        Capture Page Screenshot
        Espere o elemento estar visivel    ${searchID}    10s
        Input Text    ${searchID}    ${termo}
        Capture Page Screenshot
        Press Keys    ${searchID}    ENTER
        Wait Until Page Contains    ${termo}    10s

    ELSE
        Log To Console     Tentativa ${tentativa}: página não carregou, recarregando...
        Reload Page

        ${tentativa}=    Evaluate    ${tentativa} + 1

        Run Keyword If    ${tentativa} <= 3    Pesquisar no blog    ${termo}    ${tentativa}
        Run Keyword If    ${tentativa} > 3    Fail    Página não carregou após 3 tentativas
    END
