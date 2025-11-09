*** Settings ***

Resource    ../resources/actions/ACESSAR_BLOG.resource
Resource    ../resources/actions/CONSULTAR_EMPRESTIMO_CONSIGNADO.resource
Resource    ../resources/actions/SELECIONAR_RESULTADO_DA_BUSCA.resource

Test Setup       Abrir Navegador    ${google}    chrome
Test Teardown    Fechar Navegador

*** Test Cases ***

Realizar consulta de Emprestimo Consignado no blog do agi e validar o footer da pagina
    [Documentation]    Cenário 01: Realizar uma consulta de Emprestimo Consignado no blog do agi
    [Tags]    regressivo   CN01

    Given que eu acesso o blog do agi
    When realizar uma consulta sobre Emprestimo Consignado
    AND selecionar o resultado da busca
    Then será validado o footer da pagina
        
Inscrever usuario na newsletter do blog do agi
    [Documentation]    Cenário 02: Inscrever usuário na newsletter do blog do agi
    [Tags]    regressivo   CN02

    Given que temos um usuario de e-mail válido
    AND que eu acesso o blog do agi
    When realizar uma consulta sobre Emprestimo Consignado
    AND inscrever usuario na newsletter do blog do agi
    Then será validada a inscrição na newsletter


