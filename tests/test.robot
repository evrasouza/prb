*** Settings ***
Resource          ../resources/filter_keywords.robot

*** Test Cases ***
Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    [Template]    Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    #URL_DICTIONARY    #MODELS    #ENDS_ON_POW        #ENDS_ON            
    ${EN}              Models     Ends on {0}         Ends on             
    ${FR}              Modèles    Se termine le {0}   Se termine le       
    ${FI}              Mallit     Päättyy {0}         Päättyy             
    ${NO}              Modeller   Slutter på {0}      Slutter på           
    ${SV}              Modeller   Slutar på {0}       Slutar på           
    ${ES}              Modelos    Termina el {0}      Termina el          
    ${PT}              Modelos    Termina em {0}      Termina em          
    ${DE}              Modelle    Endet am {0}        Endet am            
    ${NL}              Modellen   Eindigt op {0}      Eindigt op          
    ${IT}              Modelli    Termina il {0}      Termina il          

***Keywords***
Scenario Outline 01 - Verify translations for Ends on and Models on Promotion Page and Promotion Banner
    [Arguments]    ${URL_DICTIONARY}    ${MODELS}    ${ENDS_ON_POW}    ${ENDS_ON}
    GIVEN client sends GET request to filter endpoint    ${URL_DICTIONARY}
    THEN the user checks the translations for the texts: "${MODELS}", "${ENDS_ON_POW}, "${ENDS_ON}"

# comando para rodar ambiente de dev
# robot --variable ENVIRONMENT:dev1. --variable BRAND:sea-doo.brp -d /reports tests/test.robot

# comando para rodar ambiente prod
# robot --variable BRAND:sea-doo.brp -d /reports tests/test.robot