*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
...
...               Since all the elements have a clear ID value, there's no need
...               to create a POM structure for the locators
Library           SeleniumLibrary

*** Variables ***
${SERVER}               testsheepnz.github.io 
${BROWSER}              Chrome
${DELAY}                0
${CALCULATOR URL}       https://${SERVER}/BasicCalculator.html
${BUILD}                2

*** Keywords ***
Open Calculator
    Open Browser    ${CALCULATOR URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Calculator Should Be Open

Calculator Should Be Open
    Title Should Be    Basic Calculator

Go To Calculator Page
    Go To    ${CALCULATOR URL}
    Calculator Should Be Open

Select Build
    Select From List By Label    selectBuild     ${BUILD}

Input First Number
    [Arguments]     ${number1}
    Input text      number1Field        ${number1}

Input Second Number
    [Arguments]     ${number2}
    Input text      number2Field        ${number2}
 
Select Operation Type
    [Arguments]     ${operationType}
    Select From List By Label    selectOperationDropdown     ${operationType}

Click On Calculate Button
    Click Element       calculateButton

Select Integers Only
    Wait Until Element Is Visible       integerSelect          10
    Select Checkbox     integerSelect

Clear Calculator
    Click Element       clearButton

Answer Should Be
    [Arguments]     ${expectedAnswer}
    Wait Until Element Is Visible       numberAnswerField       10
    Textfield Value Should Be           numberAnswerField       ${expectedAnswer}

Error Message Should Be
    [Arguments]     ${errorMessage}
    Wait Until Element Is Visible   errorMsgField               10
    Element Text Should Be          errorMsgField               ${errorMessage}