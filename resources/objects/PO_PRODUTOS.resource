*** Settings ***

Resource    ${EXECDIR}/functions/Constants.resource
Resource    ${EXECDIR}/functions/Utils.resource

*** Variables ***

${MENU_PRODUTOS}     (//span[@class='menu-text'][normalize-space()='Produtos'])[1]


*** Keywords ***

será validado a pagina produtos
    [Documentation]    Validar os principais pontos da pagina produtos do blog do agi

    Page Should Contain Element  ${MENU_PRODUTOS}
    Page Should Contain  Produtos 