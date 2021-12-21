*** Settings ***
Documentation     Tests related to happy path scenarios.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using test setup and teardown.
Suite Setup      Run Keywords
...              Open Calculator    AND
...              Select Build
Suite Teardown   Close Browser
Test Teardown    Clear Calculator
Test Template    The Operation Should Return The Expected Answer
Resource         resource.robot

*** Test Cases ***              NUMBER 1    NUMBER 2    OPERATION TYPE      EXPECTED ANSWER        
Positive Int Sum                1           2           Add                 3
Positive Int Subtraction        2           1           Subtract            1
Positive Int Multiplication     2           3           Multiply            6
Positive Int Division           8           4           Divide              2
Positive Int Concatenation      5           6           Concatenate         56
Decimal Sum                     1.5         2.5         Add                 4
Decimal Subtraction             3.5         2.4         Subtract            1.1
Decimal Multiplication          2.5         1.5         Multiply            3.75
Decimal Division                1.5         0.5         Divide              3
Decimal Concatenation           2.2         2.5         Concatenate         2.22.5
Decimal and Int Sum             2           1.5         Add                 3.5
Decimal and Int Subtraction     2           0.5         Subtract            1.5
Decimal and Int Multiplication  2           3.2         Multiply            6.4
Decimal and Int Division        3           1.5         Divide              2
Decimal and Int Concatenation   5           6.6         Concatenate         56.6
Negative Answer Sum             -5          4           Add                 -1
Negative Answer Subtraction     -20         10          Subtract            -30          
Negative Answer Multiplication  -10         4           Multiply            -40
Negative Answer Division        10          -1          Divide              -10
Text Concatenation              abc         xyz         Concatenate         abcxyz

*** Keywords ***
The Operation Should Return The Expected Answer
    [Arguments]    ${number1}    ${number2}    ${operationType}    ${expectedAnswer}
    Input First Number          ${number1}  
    Input Second Number         ${number2}
    Select Operation Type       ${operationType}
    Click On Calculate Button
    Answer Should Be            ${expectedAnswer}