*** Settings ***
Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website
*** Variables ***
${LOGIN URL}        https://dareit.futbolkolektyw.pl/en
#${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
# xPath
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*/header/div/h6
${LAST_CREATED_PLAYER_BUTTON_XPATH}		xpath=//*/div[3]/div/div/a[1]/button
${LAST_UPDATED_PLAYER_BUTTON_XPATH}    xpath=//*/a[2]/button
${FORM_HEADER}    xpath=//*/form/div[1]/div/span

${MAIN_PAGE_XPATH}    xpath=//*/ul[1]/div[1]

${EMAIL_FIELD_PLAYER_XPATH}		xpath=//*[@name='email']
${PHONE_FIELD_XPATH}		xpath=//*[@name='phone']
${LANGUAGE_PLAYER_BUTTON_XPATH}        xpath=//*[@aria-label='Add language']
${LANGUAGE_PLAYER_FIELD_XPATH}		xpath=//*[@name='languages[0]']
${LANGUAGE_PLAYER_FIELD_1_XPATH}		xpath=//*[@name='languages[1]']

${PREVIOUS_CLUB_XPATH}    xpath=//*[@name='prevClub']

${SUBMIT_BUTTON_XPATH}		xpath=//*[@type='submit']


# data
${E-MAIL_USER}		user06@getnada.com
${PASSWORD}		Test-1234

${LANGUAGE_PLAYER_1}		Japanese
${PREVIOUS_CLUB}    OPlalkknsjbdh

*** Test Cases ***
Updating the last Added player form
    Open login page
    Type in email
    Type in password
    Signin button
    Click on the Last created player button
    Update the form and submit
    [Teardown]      Close Browser

*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
Type in email
    Input Text      ${EMAILINPUT}   ${E-MAIL_USER}
Type in password
    Input Text       ${PASSWORDINPUT}   ${PASSWORD}
Signin button
    Click Element   ${SIGNINBUTTON}
    wait until element is visible    ${PAGELOGO}
Click on the Last created player button
    Click Element    ${LAST_CREATED_PLAYER_BUTTON_XPATH}
    wait until element is visible    ${FORM_HEADER}

Update the form and submit
    Click Element    ${LANGUAGE_PLAYER_BUTTON_XPATH}
    Press Keys    ${LANGUAGE_PLAYER_FIELD_1_XPATH}    CTRL+A+DELETE
    Input Text    ${LANGUAGE_PLAYER_FIELD_1_XPATH}    ${LANGUAGE_PLAYER_1}
    Input Text    ${PREVIOUS_CLUB_XPATH}     ${PREVIOUS_CLUB}
    Click Element    ${SUBMIT_BUTTON_XPATH}
    Capture Page Screenshot    allert.png
    Click Element    ${MAIN_PAGE_XPATH}
    Wait Until Element Is Visible    ${LAST_UPDATED_PLAYER_BUTTON_XPATH}
    Click Element    ${LAST_UPDATED_PLAYER_BUTTON_XPATH}
    Wait Until Element Is Visible    ${EMAIL_FIELD_PLAYER_XPATH}
    Capture Page Screenshot    check_lang.png
