*** Settings ***

Resource    ${EXECDIR}/functions/Constants.resource
Resource    ${EXECDIR}/functions/Utils.resource

*** Variables ***

${XPATH_PRIMEIRO_RESULTADO}         (//div[@class='post-content ast-width-md-6'])[1]
${TXT_LEI_EMPRESTIMO_CONSIGNADO}    css:#principais-pontos-da-lei-do-empréstimo-consignado
${footer}                           //p[normalize-space()='Copyright © 2025 Blog do Agi |']
${btn_inscrever_newsletter}        css:button[name="jetpack_subscriptions_widget"]
${input_email_newsletter}          css:#subscribe-field-blog_subscription-3
${EMAIL_TESTE}


*** Keywords ***

Selecionar Primeiro Resultado Da Busca
    [Arguments]    ${XPATH_PRIMEIRO_RESULTADO}
    [Documentation]    Selecionar o primeiro resultado da busca realizada sobre Seguros

    TRY
        Espere o elemento estar visivel    ${XPATH_PRIMEIRO_RESULTADO}    10s
    EXCEPT
        Press Keys    None    CTRL+SHIFT+R
        Espere o elemento estar visivel    ${XPATH_PRIMEIRO_RESULTADO}    10s
    END

    ${OBTER_TEXTO}    Get Text    ${XPATH_PRIMEIRO_RESULTADO}
    
    Click Element    ${XPATH_PRIMEIRO_RESULTADO}

    #Validação da busca sobre Emprestimo Consignado
    Page Should Contain    ${OBTER_TEXTO}

Validar o footer da pagina
    [Documentation]    Validar o footer do blog do agi
    
    Rolar Até Elemento Carregar  ${footer}  200
    Capture Page Screenshot
    Scroll Element Into View    ${footer}
    Should Contain    ${footer}    Copyright
    Capture Page Screenshot

inscrever usuario na newsletter do blog do agi
    [Documentation]    Inscrever usuário na newsletter do blog do agi
    
    Espere o elemento estar visivel    ${input_email_newsletter}    10s
    Rolar Até Elemento Carregar  ${input_email_newsletter}  200
    Input Text  ${input_email_newsletter}    ${EMAIL_TESTE}
    Capture Page Screenshot
    Wait Until Element Is Enabled    ${btn_inscrever_newsletter}    10s
    Click Element    ${btn_inscrever_newsletter}

será validada a inscrição na newsletter
    [Documentation]    Validar a inscrição na newsletter do blog do agi

    ${VISIVEL}    Run Keyword And Return Status    Wait Until Page Contains    Sucesso! Enviamos um e-mail para confirmar a sua assinatura.    30s
    
    IF    ${VISIVEL}

        Log    Inscrição realizada com sucesso.

    ELSE

        Fail    Falha na inscrição da newsletter.
        
    END
    
    Capture Page Screenshot


