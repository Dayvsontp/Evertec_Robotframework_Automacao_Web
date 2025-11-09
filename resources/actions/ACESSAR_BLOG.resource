*** Settings ***
Documentation       *Action Name*: Acessar Blog
...                 *Test Case*: Qualquer teste que necessite acessar o blog do agi
...                 *Author*: Dayvson Tavares

Resource    ${EXECDIR}/functions/Constants.resource
resource    ${EXECDIR}/functions/Utils.resource
Resource    ../objects/PO_PAGINA_PRINCIPAL.resource


*** Keywords ***


que eu acesso o blog do agi
    ACESSAR BLOG    ${URL_BLOG}

ACESSAR BLOG
    [Documentation]    Acessar o blog do agi
    [Arguments]    ${url}

    Acessar URL    ${url}
    Validar blog acessado  ${lupa}  30s
    