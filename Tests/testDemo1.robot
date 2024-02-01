*** Settings ***
Documentation    To Validate Login Form
Library    SeleniumLibrary

*** Test Cases ***
Validate Unsuccessful Login
    Open The Browser With LoginForm Url
    Fill The Login Form
    wait until error message is displayed
    confirm the error message

*** Keywords ***
Open The Browser With LoginForm Url
    Create Webdriver    Chrome
    Go To    https://practicetestautomation.com/practice-test-login/
    
Fill The Login Form
    Input Text    id:username    student1
    Input Password    id:password    Password123
    Click Button    id:submit
wait until error message is displayed
    Wait Until Element Is Visible    id:error
confirm the error message
    ${result} =    Get Text    id:error
    Should Be Equal As Strings    ${result}    Your username is invalid!
