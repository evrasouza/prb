*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           Browser

*** Variables ***
${ENVIRONMENT}    ${EMPTY}
${BRAND}          ${EMPTY}

*** Keywords ***
GIVEN client sends GET request to filter endpoint
    [Arguments]    ${URL_DICTIONARY}
    Create Session    filters    ${URL_DICTIONARY}    verify=true
    ${RESPONSE}=    GET On Session    filters    url=${URL_DICTIONARY}
    Set Global Variable    ${RESPONSE}

THEN the user checks the translations for the texts
    [Arguments]    ${MODELS}    ${ENDS_ON_POW}    ${ENDS_ON}    ${DEAL_AND_OFFERS}
    Should Be Equal    ${RESPONSE.json()['Models']}    ${MODELS}
    Log    ${RESPONSE.json()['Models']}
    Should Be Equal    ${RESPONSE.json()['Ends on ((POW))']}    ${ENDS_ON_POW}
    Log    ${RESPONSE.json()['Ends on ((POW))']}
    Should Be Equal    ${RESPONSE.json()['Ends on']}    ${ENDS_ON}
    Log    ${RESPONSE.json()['Ends on']}
    Should Be Equal    ${RESPONSE.json()['Deal and offers']}    ${DEAL_AND_OFFERS}
    Log    ${RESPONSE.json()['Deal and offers']}

Verify Label Text
    [Arguments]    ${locator}    ${expected_text}
    ${actual_text}=    Get Text    ${locator}
    Should Be Equal    ${actual_text}    ${expected_text}
    Log    Verificado: ${locator} contém "${actual_text}"