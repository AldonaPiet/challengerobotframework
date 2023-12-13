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
${LAST_CREATED_PLAYER_BUTTON_XPATH}		//*/div[3]/div/div/a[1]/button
${LAST_UPDATED_PLAYER_BUTTON_XPATH}    xpath=//*/a[2]/button
${FORM_HEADER}    //*/form/div[1]/div/span

${MAIN_PAGE_XPATH}    //*/ul[1]/div[1]

${EMAIL_FIELD_PLAYER_XPATH}		//*[@name='email']
${PHONE_FIELD_XPATH}		//*[@name='phone']
${HEIGHT_VALUE_FIELD_XPATH}		//*[@name='height']
${BIRTH_DATE_FIELD_XPATH}		//*[@name='age']

${SUBMIT_BUTTON_XPATH}		//*[@type='submit']
${PREVIOUS_CLUB_XPATH}    xpath=//*[@name='prevClub']

# data
${E-MAIL_USER}		user06@getnada.com
${PASSWORD}		Test-1234

${E-MAIL_PLAYER}		APpppppgmailcom
${PHONE}		'#$%^&*()(*&^%$%^&*'
${HEIGHT_VALUE}		aaaaaaaa
${BIRTH_DATE}		10000000000
${PREVIOUS_CLUB}    OPlalkknsjbdh

*** Test Cases ***
Updating the last Added player form
    Open login page
    Type in email
    Type in password
    Submit button
    Click on the Last created player button
    Fill in the form and submit
    [Teardown]      Close Browser

*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
Type in email
    Input Text      ${EMAILINPUT}   ${E-MAIL_USER}
Type in password
    Input Text       ${PASSWORDINPUT}   ${PASSWORD}
Submit button
    Click Element   ${SIGNINBUTTON}
    wait until element is visible    ${PAGELOGO}
Click on the Last created player button
    Click Element    ${LAST_CREATED_PLAYER_BUTTON_XPATH}
    wait until element is visible    ${FORM_HEADER}

Fill in the form and submit
#    Press Keys    ${EMAIL_FIELD_PLAYER_XPATH}    CTRL+A+DELETE
#    Input Text    ${EMAIL_FIELD_PLAYER_XPATH}    ${E-MAIL_PLAYER}
#    Capture Page Screenshot    wrong_e-mail.png

    Press Keys    ${PHONE_FIELD_XPATH}    CTRL+A+DELETE
    Input Text    ${PHONE_FIELD_XPATH}    ${PHONE}
    Capture Page Screenshot    wrong_phone.png

    Press Keys    ${HEIGHT_VALUE_FIELD_XPATH}    CTRL+A+DELETE
    Input Text    ${HEIGHT_VALUE_FIELD_XPATH}    ${HEIGHT_VALUE}
    Capture Page Screenshot    wrong_height.png
#
    Press Keys    ${BIRTH_DATE_FIELD_XPATH}    CTRL+A+DELETE
    Input Text    ${BIRTH_DATE_FIELD_XPATH}    ${BIRTH_DATE}
    Capture Page Screenshot    wrong_birth.png

    Input Text    ${PREVIOUS_CLUB_XPATH}     ${PREVIOUS_CLUB}
    Click Element    ${SUBMIT_BUTTON_XPATH}
    Capture Page Screenshot    to_be_saved.png

    Click Element    ${MAIN_PAGE_XPATH}
    Wait Until Element Is Visible    ${LAST_UPDATED_PLAYER_BUTTON_XPATH}
    Click Element    ${LAST_UPDATED_PLAYER_BUTTON_XPATH}
    Wait Until Element Is Visible    ${EMAIL_FIELD_PLAYER_XPATH}
    Capture Page Screenshot    check_wrong_data.png
