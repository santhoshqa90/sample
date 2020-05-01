*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://cvm.xerago.net/
${BROWSER}        chrome

*** Test Cases ***
Valid Credentials Test
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Go to    ${LOGIN URL}
    
    Maximize Browser Window
    Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    Element Text Should Be    //label[@class='loginLabel']    Username
    Element Text Should Be    //label[@for='form_password']    Password
    SeleniumLibrary.Input Text    id=form_username    cvmcreator
    SeleniumLibrary.Input Text    id=form_password    cvmcreator@123
    Click Button    form_login

*** Keywords ***
