
# Basic Calculator Test Suite
This is a study repository that shows a Robot Framework + SeleniumLibrary + ChromeDriver solution to test the Basic Calculator found in:

https://testsheepnz.github.io/BasicCalculator.html

## Test Cases
There's a total os 29 test cases, the test case files as well as a resource file used by them are located in the `calculator_tests` directory.
 
**TIP:** You can click on the file names to see the latest versions.

### [valid_operations.robot](https://github.com/sklarow/calculator_tests/blob/main/calculator_tests/valid_operations.robot)
Tests related to happy path scenarios of the 5 operations, this suite also demonstrates using test setup and teardown\
### [invalid_operations.robot](https://github.com/sklarow/calculator_tests/blob/main/calculator_tests/bug_verification.robot)
Tests related to invalid operations return messages\
### [integers_only_flag.robot](https://github.com/sklarow/calculator_tests/blob/main/calculator_tests/integers_only_flag.robot)
Tests related to the feature (checkbox) that only shows the answer as an integer value\
### [bug_verification.robot](https://github.com/sklarow/calculator_tests/blob/main/calculator_tests/bug_verification.robot)
A test suite with a single Gherkin style test, simulating a bugfix verification\
### [resource.robot](https://github.com/sklarow/calculator_tests/blob/main/calculator_tests/resource.robot)
The resource file with the global variables and reusable keywords

## Running the tests

You will need 4 thing to run the tests:

 1. Python 3+;
 2. RobotFramework;
 3. SeleniumLibrary
 4. Google ChromeDriver;
 
### Installing (MAC OS):
 
 1.	Download the latest Python Version from https://www.python.org/downloads/macos/
 2.	Verify if everything is running fine:\
`python3 --version`\
`pip3 --version`
  3. Install Robot Framework and Selenium Library via pip:\
  `pip install robotframework`\
  `pip install robotframework-SeleniumLibrary`
   
4. Install the ChromeDriver via Brew:\
`brew install chromedriver`

[Click here for more detailed installation instructions](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions)
### Running Tests
To run all the tests you can simple run this command:\
`robot --variable calculator_tests`\
You can also run a single test suite:\
`robot --variable calculator_tests/bug_verification.robot`\
You can check more detailed examples [here](https://dev.to/juperala/how-to-run-robot-framework-test-from-command-line-5aa)

### Using Other Build or Browser
By default the tests are running on the BUILD 2, you can edit the resource file or simple add the `--variable BUILD:3` to your command, for example:\
`robot --variable BUILD:3 calculator_tests/bug_verification.robot`\
The same applies if you are looking for a different browser (note that you will need the respective browser driver), for example:\
`robot --variable BROWSER:firefox calculator_tests`


## Test Results
On the Prototype Build all the tests passed, but using the Build #2, only 19 of the 29 tests passed, the detailed report can be found here:
- [report.html](https://github.com/sklarow/calculator_tests/blob/main/report.html)

# Conclusions/observations
- Since all the elements had an clear ID name, was not necessary create a resource with the locators of the elements;
- We are dealing with 5 operations and infinite possibilites of numbers combinations, so we have to define a test strategy to have enough scenarios to cover the most common numbers/operations, a boundary Value Analysis and/or Equivalence Partitioning Testing approach seems to be a good place to start;
- Robot Framework is an funny and efficient way to make test automations! :ˆ)
