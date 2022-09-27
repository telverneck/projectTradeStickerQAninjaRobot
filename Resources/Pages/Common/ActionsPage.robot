***Settings***
Documentation        This page contains all actions that can 
...                  be used in any project
Library         SeleniumLibrary
Library         FakerLibrary
Library         String
Library         DateTime 



*** Keywords ***

FakerData
    [Documentation]     Get random fake attribute
    ...                 Exmaple: Input Text     ${emailContactText}             ${FAKERDATA}[email]
    
    ${FAKERFIRSTNAME}=      First Name
    ${FAKERLASTNAME}=       Last Name
    ${FAKERADDRESS}=        Street Address
    ${FAKERPASSWORD}=       Password    length=10
    ${FAKERPHONE}=          Random Number   digits=9 
    ${FAKERZIPCODE}=        Postalcode
    ${FAKERCITY}=           City
    ${FAKERNUMBER}=         Randomize Nb Elements   le=2    min=1    max=50
    ${FAKEREMAIL}=          Free Email
    ${FAKEROPTION1OR2}=     Randomize Nb Elements   le=1    min=0    max=2
    ${FAKERTEXT}=           Text        max_nb_chars=200
    ${FAKERIBAN}=           Iban        


    Set Global Variable   &{FAKERDATA}    name=${FAKERFIRSTNAME}  lastName=${FAKERLASTNAME}   address=${FAKERADDRESS} 
    ...     password=${FAKERPASSWORD}   phone=${FAKERPHONE}     zipCode=${FAKERZIPCODE}     city=${FAKERCITY}
    ...     randomNumber=${FAKERNUMBER}     email=${FAKEREMAIL}     randomOption=${FAKEROPTION1OR2}     text=${FAKERTEXT}
    ...    iban=${FAKERIBAN}



Check Page Title
    [Arguments]    ${pageTitle}
    #Check if necessary
    Wait Until Location Contains 	 ${BASEURL} 
    Title Should Be 	             ${pageTitle}

Text To Lower Case
    [Arguments]        ${text}
    ${str1}= 	    Convert To Lowercase        ${text}
    [Return]        ${str1}

Text To Upper Case
    [Arguments]        ${text}
    ${str1} = 	Convert To Uppercase        ${text}
    [Return]        ${str1}

Switch To New Tab
    @{WindowHandles}=    Get Window Handles
    Switch Window         ${WindowHandles}[1]

Switch To Default Tab
    @{WindowHandles}=    Get Window Handles
    Switch Window         ${WindowHandles}[0]

Get Faker Email
    ${fakerEmail}=      Email
    [return]     ${fakerEmail}


Get Faker Name
    ${fakerName}=      Full Name
    [return]     ${fakerName}

Select All Checkboxes
    [Arguments]        ${webElements}
    @{checkboxes}    Get WebElements    ${webElements}
    
    FOR    ${checkbox}    IN    @{checkboxes}
        Select Checkbox    ${checkbox}
    END

Click JavaScript
    [Arguments]    ${element}
    execute javascript    arguments[0].click();    ARGUMENTS    ${element}

Accept Alert
    ${alert}=    handle alert    action=ACCEPT

Dismiss Alert
    ${alert}=    handle alert    action=DISMISS

Leave Alert Opened
    ${alert}=    handle alert    action=LEAVE

Generate Randon Date Of Birth
    [Arguments]     ${minimumAge}
    ${date}=                Get Current Date
    ${currentTimeStamp}=    Convert Date        ${date}     epoch   exclude_millis=yes
    ${currentYear}=         Convert Date        ${date}     result_format=%Y

    ${compareYear}=         Convert To Integer      ${currentYear}
    ${numberYears}=         Convert To Integer      ${minimumAge}
    ${compareYear}=         Run Keyword             Evaluate    ${compareYear}-${numberYears}
    ${secsPerYear}=         Set Variable            31557600
    ${subtractSeconds}=     Run Keyword             Evaluate    ${minimumAge}*${secsPerYear}
    ${minAgeTimeStamp}=     Run Keyword             Evaluate    ${currentTimeStamp}-${subtractSeconds}
    ${execStr}=             Set Variable            random.randint(1, ${minAgeTimeStamp})

    FOR    ${i}    IN RANGE     100
       ${randDate}=  Evaluate    ${execStr}  modules=random,sys
       ${randomYear}=   Convert Date    ${randDate}     result_format=%Y
        Exit For Loop If    ${compareYear} > ${randomYear}
    END
    ${randYear}=    Convert Date    ${randDate}     result_format=%Y
    ${randMonth}=   Convert Date    ${randDate}     result_format=%m
    ${randDay}=     Convert Date    ${randDate}     result_format=%d

    [Return]    ${randDay} ${randMonth} ${randYear}