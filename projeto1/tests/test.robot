*** Settings ***
Resource          ../resources/filter_keywords.robot
Resource          ../resources/translations.robot

*** Test Cases ***
Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    [Template]    Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    #URL_DICTIONARY    #MODELS           #ENDS_ON_POW        #ENDS_ON            
    ${EN}              ${EN_MODELS}      ${EN_ENDS_ON_POW}   ${EN_ENDS_ON}             
    ${FR}              ${FR_MODELS}      ${FR_ENDS_ON_POW}   ${FR_ENDS_ON}       
    ${FI}              ${FI_MODELS}      ${FI_ENDS_ON_POW}   ${FI_ENDS_ON}             
    ${NO}              ${NO_MODELS}      ${NO_ENDS_ON_POW}   ${NO_ENDS_ON}           
    ${SV}              ${SV_MODELS}      ${SV_ENDS_ON_POW}   ${SV_ENDS_ON}           
    ${ES}              ${ES_MODELS}      ${ES_ENDS_ON_POW}   ${ES_ENDS_ON}          
    ${PT}              ${PT_MODELS}      ${PT_ENDS_ON_POW}   ${PT_ENDS_ON}          
    ${DE}              ${DE_MODELS}      ${DE_ENDS_ON_POW}   ${DE_ENDS_ON}            
    ${NL}              ${NL_MODELS}      ${NL_ENDS_ON_POW}   ${NL_ENDS_ON}          
    ${IT}              ${IT_MODELS}      ${IT_ENDS_ON_POW}   ${IT_ENDS_ON}                  

***Keywords***
Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    [Arguments]    ${URL_DICTIONARY}    ${MODELS}    ${ENDS_ON_POW}    ${ENDS_ON}
    GIVEN client sends GET request to filter endpoint    ${URL_DICTIONARY}
    THEN the user checks the translations for the texts: "${MODELS}", "${ENDS_ON_POW}, "${ENDS_ON}"

# comando para rodar ambiente de dev
# robot --variable ENVIRONMENT:dev1. --variable BRAND:sea-doo.brp -d ./reports tests/test.robot

# comando para rodar ambiente prod
# robot --variable BRAND:sea-doo.brp -d ./reports tests/test.robot