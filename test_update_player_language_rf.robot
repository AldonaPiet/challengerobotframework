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
${LANGUAGE_PLAYER_BUTTON_XPATH}        //*[@aria-label='Add language']
${LANGUAGE_PLAYER_FIELD_XPATH}		//*[@name='languages[0]']
${LANGUAGE_PLAYER_FIELD_1_XPATH}		//*[@name='languages[1]']


${SUBMIT_BUTTON_XPATH}		//*[@type='submit']

# data
${E-MAIL_USER}		user06@getnada.com
${PASSWORD}		Test-1234

${LANGUAGE_PLAYER_1}		Spanish

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
#    Clear Element Text    ${LANGUAGE_PLAYER_FIELD_1_XPATH} # doesn't work :/
    Input Text    ${LANGUAGE_PLAYER_FIELD_1_XPATH}    ${LANGUAGE_PLAYER_1}
    Click Element    ${SUBMIT_BUTTON_XPATH}
    Capture Page Screenshot    allert.png
