*** Settings ***

Resource    ${EXECDIR}/functions/Constants.resource

*** Variables ***

${google}    https://www.google.com/

*** Keywords ***

Maximizar Tela
    Set Window Size    1920    1080

Limpar Cache E Cookies
    Delete All Cookies
    Execute JavaScript    window.caches.keys().then(keys => {keys.forEach(key => caches.delete(key));});

Abrir Navegador
    [Arguments]    ${url}=${google}    ${navegador}=headlesschrome
    Open Browser    ${url}    ${navegador}  
    Limpar Cache E Cookies  
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
    [Arguments]    ${localizador}    ${timeout}
    TRY
        Press Keys    None    CTRL+SHIFT+R 
        Sleep    3s
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