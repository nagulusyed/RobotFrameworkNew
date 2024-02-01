*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided by the imported seleniumlibrary.

Library    SeleniumLibrary

*** Variables ***
${username}    student1
${password}    password123
${url}    https://practicetestautomation.com/practice-test-login/

*** Keywords ***
Open The Browser With LoginForm Url
    Create Webdriver    Chrome
    Go To    ${url}
    
close browser sessions
    Close Browser
