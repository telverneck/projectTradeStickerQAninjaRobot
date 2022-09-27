***Settings***
Documentation        This page contains all actions that can 
...                  be used in any project

Library         SeleniumLibrary

*** Variables ***
${backButton}                //img[contains(@src,'back')]
${searchBarInput}            id:keyword
${searchButton}              //button[contains(text(),'Buscar')]
${searchResultsTable}        //article
${erroAlert}                 class:error

*** Keywords ***
Check DashBoardPage Page
    Wait Until Element Is Visible        ${backButton}
    Wait Until Element Is Visible        ${searchBarInput}
    Wait Until Element Is Visible        ${searchButton}

Click Back Button
    Click Element    ${backButton}
    
Search for ticket
    [Arguments]    ${ticket}
    Input Text    ${searchBarInput}     ${ticket}
    Click Search Button

Check Results
    Wait Until Element Is Visible        ${searchResultsTable}

Check No Results
    Wait Until Element Is Visible        ${erroAlert}



Click Search Button
    Click Element     ${searchButton}


