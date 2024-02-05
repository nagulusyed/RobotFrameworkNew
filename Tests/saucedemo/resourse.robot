*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided by the imported SeleniumLibrary.

Library    SeleniumLibrary

*** Variables ***
${username}    standard_user
${invalid_password}    secret_sauce1
${valid_password}    secret_sauce
${url}    https://www.saucedemo.com/

*** Keywords ***
Open The Browser With LoginForm Url
    Create Webdriver    Chrome
    Go To    ${url}
    
close browser sessions
    Close Browser
