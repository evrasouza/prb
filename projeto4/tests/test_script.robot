*** Settings ***
Resource    ../resources/filter_keywords.robot
Resource    ../resources/languages_data.robot
Library     Browser

*** Test Cases ***
Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    FOR    ${lang}    ${url_dictionary}    ${models}    ${ends_on_pow}    ${ends_on}    ${deal_and_offers}    IN    @{LANGUAGE_DATA}
        GIVEN client sends GET request to filter endpoint    ${url_dictionary}
        THEN the user checks the translations for the texts    ${models}    ${ends_on_pow}    ${ends_on}    ${deal_and_offers}
    END
