*** Settings ***
Resource    ../resources/filter_keywords2.robot
Resource    ../resources/translations2.robot

*** Variables ***
@{LANGUAGES}    EN    FR    FI    NO    SV    ES    PT    DE    NL    IT

*** Test Cases ***
Scenario Outline 01 - Verify translations for Promotion Page and Promotion Banner
    FOR    ${lang}    IN    @{LANGUAGES}
        ${translations}    Set Variable    ${${lang}_TRANSLATIONS}
        ${url_dictionary}  Set Variable    ${${lang}_URL}
        Run Keyword And Continue On Failure    Verify Translations for Promotion Page and Banner    ${url_dictionary}    ${translations}
    END
