*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside Test Suite Setup  
Suite Teardown    Log    I am inside Test Suite Teardown   
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown
Default Tags    example

*** Test Cases ***
MyFirstTest
    Log    Hello Natalie    
    

FirstSeleniumTest
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step 
    Press Keys    name=q    ENTER
    # Click Button    name=btnK    
    Sleep    2       
    Close All Browsers
    Log    Test completed   
    
SampleLoginTest
    [Documentation]    This is sample login test 
    Open Browser    ${URL2}    chrome
    Set Browser Implicit Wait    5  
    LoginKW 
    Click Element    id=welcome    
    Click Element    link=Logout  
    Close Browser  
    Log              Test completed     
    Log              This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}    https://www.google.pl/
${URL2}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text       id=txtUsername    @{CREDENTIALS}[0]
    Input Password   id=txtPassword    &{LOGINDATA}[password] 
    Click Button     id=btnLogin


