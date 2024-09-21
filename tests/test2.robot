*** Settings ***
Resource    ../resources/filter_keywords.robot
Resource    ../resources/translations.robot

*** Variables ***
@{LANGUAGES}    EN    FR    FI    NO    SV    ES    PT    DE    NL    IT

*** Test Cases ***
Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    FOR    ${lang}    IN    @{LANGUAGES}
        ${url_dictionary}    Set Variable    ${${lang}}
        ${models}    Set Variable    ${${lang}_MODELS}
        ${ends_on_pow}    Set Variable    ${${lang}_ENDS_ON_POW}
        ${ends_on}    Set Variable    ${${lang}_ENDS_ON}    
        Run Keyword And Continue On Failure    Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner    
        ...    ${url_dictionary}    ${models}    ${ends_on_pow}    ${ends_on}
    END

***Keywords***
Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    [Arguments]    ${URL_DICTIONARY}    ${MODELS}    ${ENDS_ON_POW}    ${ENDS_ON}
    GIVEN client sends GET request to filter endpoint    ${URL_DICTIONARY}
    THEN the user checks the translations for the texts: "${MODELS}", "${ENDS_ON_POW}, "${ENDS_ON}"