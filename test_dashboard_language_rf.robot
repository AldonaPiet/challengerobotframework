*** Settings ***
Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
# xpath
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*/header/div/h6
${LANGUAGE_BUTTON_XPATH}    //*/ul[2]/div[1]/div[2]/span
${ADD_PLAYER_POLISH_BUTTON_XPATH}    //*[text()='Dodaj gracza']
${ADD_PALAYER_ENGLISH_BUTTON_XPATH}    //*[text()='Add player']
#//*[text() ='English' or text()='Polski']
*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Check is Language button clickable    
    Assert dashboard
    [Teardown]      Close Browser
*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user06@getnada.com
Type in password
    Input Text       ${PASSWORDINPUT}   Test-1234
Click on the Submit button
    Click Element   xpath=//*[(text()= 'Sign in')]
Check is Language button clickable
    wait until element is visible    ${PAGELOGO}
    Wait Until Element Is Enabled    ${LANGUAGE_BUTTON_XPATH}
    Click Element    ${LANGUAGE_BUTTON_XPATH}
    Wait Until Element Is Enabled    ${ADD_PLAYER_POLISH_BUTTON_XPATH}
    Click Element    ${LANGUAGE_BUTTON_XPATH}
    Wait Until Element Is Enabled    ${ADD_PALAYER_ENGLISH_BUTTON_XPATH}
Assert dashboard
    title should be     Scouts panel
    Capture Page Screenshot     alert.png  
