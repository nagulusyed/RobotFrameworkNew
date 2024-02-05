*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided by the imported SeleniumLibrary.

Library    SeleniumLibrary

*** Variables ***
${username}    rahulshettyacademy
${invalid_password}    secret_sauce1
${valid_password}    learning
${url}    https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open The Browser With LoginForm Url
    Create Webdriver    Chrome
    Go To    ${url}
    
close browser sessions
    Close Browser
