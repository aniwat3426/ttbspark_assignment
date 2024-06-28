*** Settings ***
Library  SeleniumLibrary
Library  String
# Author: Aniwat Ruttanaudom

*** Test Cases ***
Login Success
    Open Browser  url=http://the-internet.herokuapp.com/login  browser=chrome
    Wait Until Element Is Enabled  css:#username
    Input Text  css:#username  tomsmith
    Input Text  css:#password  SuperSecretPassword!
    Click Element  css:.radius
    Page Should Contain  Secure Area
    ${msg}=   Get Text  css:#flash
    ${msg}  Remove String  ${msg}  ×  \n
    Should Be Equal  '${msg.strip()}'  'You logged into a secure area!'
    Click Element  css:.radius
    Page Should Contain   You logged out
    ${msg}=  Get Text  css:#flash
    ${msg}  Remove String  ${msg}  ×  \n
    Should Be Equal  ${msg.strip()}  You logged out of the secure area! 
    Close Browser

Login Failed - Password Incorrect
    Log To Console  Login Failed - Password Incorrect
    Open Browser  url=http://the-internet.herokuapp.com/login  browser=chrome
    Wait Until Element Is Enabled  css:#username
    Input Text  css:#username  tomsmith
    Input Text  css:#password  Password!
    Click Element  css:.radius
    Page Should Contain  Your password is invalid!
    ${msg}=  Get Text  css:#flash
    ${msg}  Remove String  ${msg}  ×  \n
    Should Be Equal  ${msg.strip()}  Your password is invalid!
    Close Browser

Login Failed - Username not found
    Log To Console  Login Fail Username not found        
        Log To Console  Login Failed - Password Incorrect
    Open Browser  url=http://the-internet.herokuapp.com/login  browser=chrome
    Wait Until Element Is Enabled  css:#username
    # Input Text  css:#username  tomsmith
    Input Text  css:#password  Password!
    Click Element  css:.radius
    Page Should Contain  Your username is invalid!
    ${msg}=  Get Text  css:#flash
    ${msg}  Remove String  ${msg}  ×  \n
    Should Be Equal  ${msg.strip()}  Your username is invalid!
    Close Browser