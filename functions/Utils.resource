*** Settings ***

Resource    ${EXECDIR}/functions/Constants.resource
*** Variables ***

${google}    https://www.google.com/

*** Keywords ***

Maximizar Tela
    Maximize Browser Window

Abrir Navegador
    [Arguments]    ${google}    ${browser}=chrome
    Open Browser    ${google}    ${browser}
    Maximizar Tela

Fechar Navegador
    Close Browser

Rolar Até Elemento Carregar
    [Arguments]    ${localizador}    ${max_tentativas}
    
    FOR    ${i}    IN RANGE    ${max_tentativas}
        # Tenta esperar que o elemento fique visível (3 segundos por tentativa)
        ${visivel}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${localizador}    3s
        
        # Se for encontrado, encerra o loop
        IF    ${visivel}
            Log    Elemento ${localizador} encontrado após ${i} rolagens.
            RETURN
        END
        
        # Pressiona a tecla Seta para Baixo (DOWN) para rolar a página
        Press Keys    xpath=//body    \ue015
        
        Sleep    0.5s    # Breve pausa para o navegador processar o scroll e o carregamento
    END
    
    # Se o loop terminar sem encontrar o elemento
    Fail    Elemento ${localizador} não carregado após ${max_tentativas} rolagens.

Espere o elemento estar visivel
    [Arguments]    ${localizador}    ${timeout}=10s
    TRY
        
        Wait Until Element Is Visible    ${localizador}    ${timeout}
    EXCEPT
        Log    Elemento ${localizador} não visível após ${timeout}.
        Fail    Pagina apresentou instabilidade e não carregou o elemento ${localizador} após ${timeout}.
    END
    
que temos um usuario de e-mail válido  
    ${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    ${EMAIL_TESTE}          Set Variable              ${palavra_aleatoria}@emailteste.com
    Set Global Variable       ${EMAIL_TESTE}
    RETURN  ${EMAIL_TESTE}