*** Settings ***
Library           SeleniumLibrary
Library           SikuliLibrary    mode=NEW

*** Test Cases ***
TestCase_1
    Open Browser    http://cvm.xerago.net    chrome
    Maximize Browser Window
    Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    Element Text Should Be    //label[@class='loginLabel']    Username
    Element Text Should Be    //label[@for='form_password']    Password
    Input Text    form_username    cvmcreator
    Input Text    form_password    cvmcreator@123
    Click Button    form_login
    Close Browser
    ${/}

TestCase_2
    Start Sikuli Process
    Add Image Path    H:/sikuli_images
    Click    chrome.png
    Click    new_tab.png
    Sleep    40s
    SikuliLibrary.Input Text    url_bar.png    http://alm.xerago.com/

TestCase_3
    Start Sikuli Process
    Add Image Path    H:/sikuli_images
    Click    window_icon.png
    Click    search.png
    SikuliLibrary.Input Text    searchbar_input.png    notepad
    Wait Until Screen Contain    notepad_icon.png    10
    Click    notepad_icon.png
    SikuliLibrary.Input Text    notepad.png    Hii Logimohan
