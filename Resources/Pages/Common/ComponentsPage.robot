***Settings***
Documentation        This page contains all commom keyword that cacn be used
...                    in the project
Library         SeleniumLibrary


*** Variables ***
${nextButton}             xpath:
${component.backButton}   xpath:
${saveButton}             xpath:
${cancelButton}           xpath:
${menuOptionLink}         xpath://nav//ul[@id='menu-primary-menu']//span[@class='menu-item-text']

*** Keywords ***

Go to menu navigation "${menuOption}"
    Wait Until Element Is Visible 	 ${menuOptionLink}\[contains(text(), '${menuOption}')]
    Click Element 	                 ${menuOptionLink}\[contains(text(), '${menuOption}')]

click button "${buttonText}"
    Wait Until Element Is Visible 	 locator=link:${buttonText} 	 timeout=None 	 error=None
    Click Link 	                     link:${buttonText} 	         modifier=False

Click Next
    Click Element        ${nextButton}

Click Back
    Click Element        ${component.backButton}

Click Save
    Click Element        ${saveButton}

Click Cancel
    Click Element        ${cancelButton}

Logout
    #TODO implementation Here




