*** Settings ***
Documentation    Tests related to know fixed bugs.
...              A sample of Gherkin syntax on Robot Framework
...              
...              For example, the test will fail in the Build 3:
...              robot --variable BUILD:3 calculator_tests/bug_verification.robot                        
Suite Teardown   Close Browser
Resource         resource.robot

*** Test Cases ***
Concatenate Without Integers Only Checkbox
    Given calculator is open
    And build is selected
    When user select the concatenate operation
    Then Integers only checkbox should not be visible    

*** Keywords ***
calculator is open
    Open Calculator

build is selected
    Select Build

user select the concatenate operation
    Select Operation Type  Concatenate

Integers only checkbox should not be visible
    Wait Until Element Is Not Visible        integerSelect          10
    Element Should Not Be Visible            integerSelect