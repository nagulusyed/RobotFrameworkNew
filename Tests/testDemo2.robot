*** Settings ***
Documentation    To Validate Login Form
Library    SeleniumLibrary
Test Teardown    close browser sessions
Resource    resourse.robot

*** Variables ***
${error_message_on_login}        css:.error-message-container
${cart_symbol_visible}    css:.shopping_cart_link


*** Test Cases ***
Validate Unsuccessful Login
    Open The Browser With LoginForm Url
    Fill The Login Form    ${username}    ${invalid_password}
    wait until element located in the page    ${error_message_on_login}
    confirm the error message

Validate on Successful Login
    Open The Browser With LoginForm Url
    Fill The Login Form     ${username}    ${valid_password}
    wait until element located in the page    ${cart_symbol_visible}

*** Keywords ***
Fill The Login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:user-name    ${username}
    Input Password    id:password    ${password}
    Click Button    id:login-button

wait until element located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
 
confirm the error message
    ${result} =    Get Text    ${error_message_on_login}
    Should Be Equal As Strings    ${result}    Epic sadface: Username and password do not match any user in this service
