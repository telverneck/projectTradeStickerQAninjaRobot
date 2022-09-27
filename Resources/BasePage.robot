***Settings***
Documentation           This is the main page for the project
Library                 SeleniumLibrary
Library                 FakerLibrary
Library                 DateTime 
Library                 String

Resource                Pages/Common/ActionsPage.robot
Resource                Pages/Common/ComponentsPage.robot
Resource                Pages/LoginPage.robot
Resource                Pages/DashboardPage.robot

Variables            locators.py



***Variables***
${BASEURL}                          https://trade-sticker-dev.vercel.app/
${BROWSER}                          ${browserName}  # locators.pt file
@{LIST_OF_BROSERS}                  chrome    firefox    edge
${LONGTIMEOUT}                      60
${TIMEOUT}                          30
${BROWSER_WIDTH}                    1440   
${BROWSER_HEIGHT}                   900
${FRAME}                            css:iframe#Simulator

${login}            ${loginEmailAccess}
${password}         ${passwordAccess}

# ${env}=    uat
# &{url_dict}=    qa=http://way2automation.com    uat=http://google.com
# open browser    ${url_dict.${env}}    ${browser}

***Keywords***
Start Session
    Open Browser            about:blank     ${BROWSER}
    Set Selenium Implicit Wait          ${TIMEOUT}
    Set window size                     ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}
    Go To                   ${BASEURL}
    ${PageTitle}=            SeleniumLibrary.Get Title
    Log                     ${PageTitle}
    Check Login Page

Start Session and Login
    Start Session
    Login With                ${login}    ${password}
    Check DashBoardPage Page
    
Close Session
    Capture Page Screenshot
    Close Browser

