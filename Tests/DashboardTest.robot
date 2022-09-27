*** Settings ***
Resource                    ../Resources/BasePage.robot
Suite Setup                 Start Session and Login
Suite Teardown              Close Session
Test Setup
Test Teardown



*** Test Cases ***
Scenario1: Check Search function
    [Documentation]    Test for Dashboard Page
    [Tags]        Dashboard    smoke    full
    
    Search for ticket    Neymar
    Check Results

Scenario1: Check no results
    [Documentation]    Test for Dashboard Page
    [Tags]        Dashboard    smoke    full
    
    Search for ticket    noResults
    Check No Results




