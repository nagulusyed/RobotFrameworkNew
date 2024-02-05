*** Settings ***
Documentation    To Validate Login Form
Library    SeleniumLibrary
Library    Collections
Library    String
#Test Teardown    Close Browser Sessions
Resource    resourse.robot


*** Test Cases ***
Validate Child Window Functionality
    Open The Browser With LoginForm Url
    Select the link of child window
    verify the user is switched to child window
    Grab the email id from the child window
    Switch to parent window and enter the email

*** Keywords ***
Select the link of child window
    Click Element    css:.blinkingText
    Sleep    5

verify the user is switched to child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST


Grab the email id from the child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
    @{words_2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_2}    0
    Set Global Variable    ${email}

Switch to parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
    Sleep    5
