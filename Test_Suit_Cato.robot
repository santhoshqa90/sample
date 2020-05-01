*** Settings ***
Library           SeleniumLibrary
Library           SikuliLibrary    mode=NEW
Library           DiffLibrary
Library           AppiumLibrary
Library           ExcelLibrary

*** Variables ***
${LOGIN URL}      http://cvm.xerago.net/
${BROWSER}        chrome
${excel_file}     I:/testdata.xls

*** Test Cases ***
Valid Credentials Test
    ${chrome_options}   Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}  Call Method     ${chrome_options}    to_capabilities
    Open Browser    ${LOGIN URL}    browser=chrome    remote_url=http://localhost:4444/wd/hub     desired_capabilities=${options}
    Maximize Browser Window
    Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    Element Text Should Be    //label[@class='loginLabel']    Username
    Element Text Should Be    //label[@for='form_password']    Password
    SeleniumLibrary.Input Text    id=form_username    cvmcreator
    SeleniumLibrary.Input Text    id=form_password    cvmcreator@123
    Click Button    form_login

*** Keywords ***
