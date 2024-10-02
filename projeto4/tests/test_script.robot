*** Settings ***
Resource    ../resources/filter_keywords.robot
#Resource    ../resources/translations.robot
Resource    ../resources/languages_data.robot
Library     Browser

*** Test Cases ***
Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    FOR    ${lang}    ${url_dictionary}    ${models}    ${ends_on_pow}    ${ends_on}    ${deal_and_offers}    IN    @{LANGUAGE_DATA}
        Log    Iniciando validação para o idioma: ${lang}
        
        # Validação da API
        #Run Keyword And Continue On Failure    GIVEN client sends GET request to filter endpoint    ${url_dictionary}
        #Run Keyword And Continue On Failure    THEN the user checks the translations for the texts    ${models}    ${ends_on_pow}    ${ends_on}    ${deal_and_offers}

        GIVEN client sends GET request to filter endpoint    ${url_dictionary}
        THEN the user checks the translations for the texts    ${models}    ${ends_on_pow}    ${ends_on}    ${deal_and_offers}
        
        # Validação da Interface Web (Opcional)
        # Run Keyword And Continue On Failure    Validate Web Translations    ${lang}    ${models}    ${ends_on_pow}    ${ends_on}    ${deal_and_offers}
    END
