*** Settings ***
Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website
*** Variables ***
${LOGIN URL}        https://dareit.futbolkolektyw.pl/en
#${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
# xpath
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*/header/div/h6
${LANGUAGE_BUTTON_XPATH}    xpath=//*/ul[2]/div[1]/div[2]/span
${ADD_PLAYER_POLISH_BUTTON_XPATH}    xpath=//*[text()='Dodaj gracza']
${ADD_PALAYER_ENGLISH_BUTTON_XPATH}    xpath=//*[text()='Add player']
${LAST_UPDATED_PLAYER_BUTTON_XPATH}     xpath=//*/a[2]/button
#data
${E-MAIL_USER}		user06@getnada.com
${PASSWORD}        Test-1234
*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Signin button
    Check is Language button clickable    
    Assert dashboard
    [Teardown]      Close Browser
*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
# asserty wyłączone na production, zostawione tylko na końcu o ile potrzebne
#    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   ${E-MAIL_USER}
Type in password
    Input Text       ${PASSWORDINPUT}   ${PASSWORD}
Click on the Signin button
    Click Element   ${SIGNINBUTTON}
Check is Language button clickable
    wait until element is visible    ${PAGELOGO}
    Wait Until Element Is Enabled    ${LANGUAGE_BUTTON_XPATH}
    Click Element    ${LANGUAGE_BUTTON_XPATH}
    Wait Until Element Is Enabled    ${ADD_PLAYER_POLISH_BUTTON_XPATH}
    Capture Page Screenshot     polish.png
    Click Element    ${LANGUAGE_BUTTON_XPATH}
    Wait Until Element Is Enabled    ${ADD_PALAYER_ENGLISH_BUTTON_XPATH}
    Capture Page Screenshot     english.png
Assert dashboard
    title should be     Scouts panel
    Capture Page Screenshot     alert.png
