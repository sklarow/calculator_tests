*** Settings ***
Documentation    Tests related to invalid operations return messages.
Suite Setup      Run Keywords
...              Open Calculator    AND
...              Select Build
Suite Teardown   Close Browser
Test Teardown    Clear Calculator
Test Template    The Operation Should Return The Expected Answer
Resource         resource.robot

*** Test Cases ***              NUMBER 1    NUMBER 2    OPERATION TYPE      ERROR MESSAGE      
Invalid Number 1                text        1           Add                 Number 1 is not a number
Invalid Number 2                23          text        Subtract            Number 2 is not a number
Both Numbers Invalid            text1       text2       Multiply            Number 1 is not a number
Divide By Zero                  10          0           Divide              Divide by zero error!

*** Keywords ***
The Operation Should Return The Expected Answer
    [Arguments]    ${number1}    ${number2}    ${operationType}    ${errorMessage}
    Input First Number          ${number1}  
    Input Second Number         ${number2}
    Select Operation Type       ${operationType}
    Click On Calculate Button
    Error Message Should Be     ${errorMessage}