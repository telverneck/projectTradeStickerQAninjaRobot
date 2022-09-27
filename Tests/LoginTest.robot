*** Settings ***
Resource                    ../Resources/BasePage.robot
Suite Setup                 Start Session
Suite Teardown              Close Session
Test Setup
Test Teardown

*** Variables ***
${login}            ${loginEmailAccess}
${password}         ${passwordAccess}

*** Test Cases ***
Scenario1: Check Login Page
    [Documentation]    Test for Login Page
    [Tags]        login    smoke    full
    
    Login With    ${login}    ${password}
    Check DashBoardPage Page




