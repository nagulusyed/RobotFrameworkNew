*** Settings ***
Documentation    To Validate Login Form
Library    SeleniumLibrary
Library    Collections
Test Teardown    Close Browser Sessions
Resource    resourse.robot

*** Variables ***
${error_message_on_login}        css:.error-message-container
${cart_symbol_visible}    css:.shopping_cart_link


*** Test Cases ***
#Validate Unsuccessful Login
#    Open The Browser With LoginForm Url
#    Fill The Login Form    ${username}    ${invalid_password}
#    wait until element located in the page    ${error_message_on_login}
#    confirm the error message

Validate on Successful Login
    Open The Browser With LoginForm Url
    Fill The Login Form     ${username}    ${valid_password}
    wait until element located in the page    ${cart_symbol_visible}
    Verify card titles on homepage
    Select the card    Sauce Labs Bolt T-Shirt

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


Verify card titles on homepage
    @{expectedList} =     Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    ${elements} =    Get Webelements    css:.inventory_item_name
    @{actualList} =    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}     ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the card
    [Arguments]    ${cardName}
    ${elements} =    Get Webelements    css:.inventory_item_name
    ${index}    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Run Keyword If    '${cardName}' == '${element.text}'    Click Button    xpath:(//*[@class='btn btn_primary btn_small btn_inventory '])[${index}]
        ${index} =    Evaluate    ${index} + 1
    END

