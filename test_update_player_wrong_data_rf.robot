*** Settings ***
Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
# xPath
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*/header/div/h6
${LAST_CREATED_PLAYER_BUTTON_XPATH}		//*/div[3]/div/div/a[1]/button
${FORM_HEADER}    //*/form/div[1]/div/span

${MAIN_PAGE_XPATH}    //*/ul[1]/div[1]

${EMAIL_FIELD_PLAYER_XPATH}		//*[@name='email']
${PHONE_FIELD_XPATH}		//*[@name='phone']
${HEIGHT_VALUE_FIELD_XPATH}		//*[@name='height']
${BIRTH_DATE_FIELD_XPATH}		//*[@name='age']

${SUBMIT_BUTTON_XPATH}		//*[@type='submit']

# data
${E-MAIL_USER}		user06@getnada.com
${PASSWORD}		Test-1234

${E-MAIL_PLAYER}		APpppppgmailcom
${PHONE}		'#$%^&*()(*&^%$%^&*'
${HEIGHT_VALUE}		aaaaaaaa
${BIRTH_DATE}		10000000000

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
    Clear Element Text    ${EMAIL_FIELD_PLAYER_XPATH} # does not work
    Press Keys    ${EMAIL_FIELD_PLAYER_XPATH}    CTRL+A+DELETE
    Input Text    ${EMAIL_FIELD_PLAYER_XPATH}    ${E-MAIL_PLAYER} # player can be saved

    Press Keys    ${PHONE_FIELD_XPATH}    CTRL+A+DELETE
    Input Text    ${PHONE_FIELD_XPATH}    ${PHONE} # player can be saved

    Press Keys    ${HEIGHT_VALUE_FIELD_XPATH}    CTRL+A+DELETE
    Input Text    ${HEIGHT_VALUE_FIELD_XPATH}    ${HEIGHT_VALUE} # player can be saved but with 'e' value instead of letters

    Press Keys    ${BIRTH_DATE_FIELD_XPATH}    CTRL+A+DELETE
    Input Text    ${BIRTH_DATE_FIELD_XPATH}    ${BIRTH_DATE} # player can be saved

    Click Element    ${SUBMIT_BUTTON_XPATH}
    Wait Until Element Is Enabled    ${MAIN_PAGE_XPATH}
    Sleep    7s
    Capture Page Screenshot    picture.png