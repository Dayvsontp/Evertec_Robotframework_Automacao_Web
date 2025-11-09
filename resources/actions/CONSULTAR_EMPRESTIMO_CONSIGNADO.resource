*** Settings ***
Documentation       *Action Name*: CONSULTAR_EMPRESTIMO_CONSIGNADO
...                 *Test Case*: Pesquisar por Emprestimo Consignado no blog do agi
...                 *Author*: Dayvson Tavares

Resource    ${EXECDIR}/functions/Constants.resource
Resource    ${EXECDIR}/functions/Utils.resource
Resource    ../objects/PO_PAGINA_PRINCIPAL.resource

*** Variables ***
${TERMO_EMPRESTIMO_CONSIGNADO}    Empréstimo Consignado

*** Keywords ***
realizar uma consulta sobre Emprestimo Consignado
    [Documentation]    Realizar uma consulta sobre Emprestimo Consignado no blog do agi
    Espere o elemento estar visivel    ${lupa}    5s
    Pesquisar no blog    ${TERMO_EMPRESTIMO_CONSIGNADO}
    
   