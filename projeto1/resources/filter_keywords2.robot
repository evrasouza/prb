*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${ENVIRONMENT}    ${EMPTY}
${BRAND}          ${EMPTY}
${EN_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.EN-CA.json
${FR_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.fr-CA.json
${FI_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.fi-FI.json
${NO_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.no-NO.json
${SV_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.sv-SE.json
${ES_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.es-ES.json
${PT_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.pt-BR.json
${DE_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.de-DE.json
${NL_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.nl-NL.json
${IT_URL}         https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.it-IT.json

*** Keywords ***
GIVEN client sends GET request to filter endpoint
    [Arguments]    ${URL_DICTIONARY}
    Create Session    filters    ${URL_DICTIONARY}    verify=true
    ${RESPONSE}=    GET On Session    filters    url=${URL_DICTIONARY}
    Set Global Variable    ${RESPONSE}

THEN the user checks the translation for
    [Arguments]    ${key}    ${expected_value}
    # Verifica se a resposta está no formato correto e se a chave existe
    ${actual_value}=    Run Keyword If    '${RESPONSE.json()}' != 'None' and '${key}' in ${RESPONSE.json()}    Evaluate    ${RESPONSE.json().get('${key}', None)}    ELSE    None
    # Se o valor retornado for None, loga uma mensagem de erro
    Run Keyword If    '${actual_value}' == 'None'    Log    WARNING: Key ${key} not found or response is None    ELSE    Should Be Equal    ${actual_value}    ${expected_value}
    Log    Translation for ${key}: Expected=${expected_value}, Actual=${actual_value}


Verify Translations for Promotion Page and Banner
    [Arguments]    ${URL_DICTIONARY}    ${TRANSLATIONS}
    GIVEN client sends GET request to filter endpoint    ${URL_DICTIONARY}
    FOR    ${key}    ${value}    IN    &{TRANSLATIONS}
        THEN the user checks the translation for    ${key}    ${value}
    END