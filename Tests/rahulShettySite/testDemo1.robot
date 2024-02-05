*** Settings ***
Documentation    To Validate Login Form
Library    SeleniumLibrary
Library    Collections
#Test Teardown    Close Browser Sessions
Resource    resourse.robot


*** Test Cases ***
Select the form and navigate to test window
    Open The Browser With LoginForm Url
    Fill the login details and select the user option    ${username}    ${valid_password}

*** Keywords ***

Fill the login details and select the user option
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button    id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms
    Click Button    id:signInBtn
