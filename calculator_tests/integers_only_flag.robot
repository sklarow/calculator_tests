*** Settings ***
Documentation    Tests related to the feature that only shows the answer as an integer value.
Suite Setup      Run Keywords
...              Open Calculator    AND
...              Select Build
Suite Teardown   Close Browser
Test Teardown    Clear Calculator
Test Template    The Operation Should Return The Expected Answer
Resource         resource.robot

*** Test Cases ***              NUMBER 1    NUMBER 2    OPERATION TYPE      EXPECTED ANSWER        
Sum                             2           1.5         Add                 3
Subtraction                     3.5         2.4         Subtract            1
Multiplication                  2.5         1.5         Multiply            3
Division                        1.5         0.5         Divide              3

*** Keywords ***
The Operation Should Return The Expected Answer
    [Arguments]    ${number1}    ${number2}    ${operationType}    ${expectedAnswer}
    Input First Number          ${number1}  
    Input Second Number         ${number2}
    Select Operation Type       ${operationType}
    Click On Calculate Button
    Select Integers Only
    Answer Should Be            ${expectedAnswer}