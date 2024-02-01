*** Settings ***
Documentation    To Validate Login Form
Library    SeleniumLibrary
Test Teardown    close browser sessions
Resource    resourse.robot

*** Variables ***
${error_message_on_login}        id:error

*** Test Cases ***
Validate Unsuccessful Login
    Open The Browser With LoginForm Url
    Fill The Login Form
    wait until error message is displayed
    confirm the error message

*** Keywords ***

    
Fill The Login Form
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:submit

wait until error message is displayed
    Wait Until Element Is Visible    ${error_message_on_login}

confirm the error message
    ${result} =    Get Text    ${error_message_on_login}
    Should Be Equal As Strings    ${result}    Your username is invalid!
