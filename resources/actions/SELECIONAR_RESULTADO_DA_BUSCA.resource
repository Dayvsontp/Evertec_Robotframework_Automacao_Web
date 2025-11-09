*** Settings ***
Documentation       *Action Name*: Acessar Blog
...                 *Test Case*: Qualquer teste que necessite acessar o blog do agi
...                 *Author*: Dayvson Tavares

Resource    ${EXECDIR}/functions/Constants.resource
Resource    ${EXECDIR}/functions/Utils.resource
Resource    ../objects/PO_PAGINA_PRINCIPAL.resource
Resource    ../objects/PO_RESULTADO_EMPRESTIMO_CONSIGNADO.resource


*** Keywords ***
selecionar o resultado da busca
    [Documentation]    Selecionar o primeiro resultado da busca realizada sobre Emprestimo Consignado

    
    Espere o elemento estar visivel    ${XPATH_PRIMEIRO_RESULTADO}    20s
    Capture Page Screenshot
    Selecionar Primeiro Resultado Da Busca    ${XPATH_PRIMEIRO_RESULTADO}
    
será validado o footer da pagina
    [Documentation]    Validar os principais pontos da lei do emprestimo consignado no artigo selecionado

    Validar o footer da pagina
    