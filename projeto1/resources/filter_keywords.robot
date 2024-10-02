*** Settings ***
Library           RequestsLibrary
Library           Collections

***Variables***
${ENVIRONMENT}    ${EMPTY}
${BRAND}    ${EMPTY}
${EN}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.EN-CA.json
${FR}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.fr-CA.json
${FI}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.fi-FI.json
${NO}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.no-NO.json
${SV}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.sv-SE.json
${ES}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.es-ES.json
${PT}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.pt-BR.json
${DE}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.de-DE.json
${NL}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.nl-NL.json
${IT}    https://${ENVIRONMENT}${BRAND}.com/libs/cq/i18n/dict.it-IT.json

*** Keywords ***
GIVEN client sends GET request to filter endpoint
    [Arguments]    ${URL_DICTIONARY}
    Create Session    filters    ${URL_DICTIONARY}    verify=true
    ${RESPONSE}=    GET On Session    filters    url=${URL_DICTIONARY}
    Set Global Variable    ${RESPONSE}

THEN the user checks the translations for the texts: "${MODELS}", "${ENDS_ON_POW}, "${ENDS_ON}", "${DEAL_AND_OFFERS}"
    Should Be Equal    ${RESPONSE.json()['Models']}    ${MODELS}
    Log    ${RESPONSE.json()['Models']}
    Should Be Equal    ${RESPONSE.json()['Ends on ((POW))']}    ${ENDS_ON_POW}
    Log    ${RESPONSE.json()['Ends on ((POW))']}
    Should Be Equal    ${RESPONSE.json()['Ends on']}    ${ENDS_ON}
    Log    ${RESPONSE.json()['Ends on']}
    Should Be Equal    ${RESPONSE.json()['Deal and offers']}    ${DEAL_AND_OFFERS}
    Log    ${RESPONSE.json()['Deal and offers']}

THEN the user checks the translation for "${key}" with value "${value}"
    [Arguments]    ${key}    ${expected_value}
    
    # Aqui você pode obter o valor real da página ou da resposta da API
    ${actual_value}    Get Text From Page Or API    ${key}
    
    # Verifica se o valor real é igual ao valor esperado
    Should Be Equal    ${actual_value}    ${expected_value}