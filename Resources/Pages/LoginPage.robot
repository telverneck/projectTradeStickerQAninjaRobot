***Settings***
Documentation        This page contains all actions that can 
...                  be used in any project
Library         SeleniumLibrary


*** Variables ***
${loginInput}            name:email
${passwordInput}         name:password
${loginButton}           //button[contains(text(),'Entrar')]

*** Keywords ***
Check Login Page
    Wait Until Element Is Visible    ${loginButton}
    Element Should Be Visible        ${loginButton}

Login With
    [Arguments]    ${login}    ${password}
    Check Login Page
    Input Text                            ${loginInput}        ${login}
    Input Text                            ${passwordInput}     ${password}
    Click Element                        ${loginButton}