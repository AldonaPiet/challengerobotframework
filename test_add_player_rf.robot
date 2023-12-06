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
${FORM_HEADER}    //*/form/div[1]/div/span

${MAIN_PAGE_XPATH}    //*/ul[1]/div[1]

${PLAYERS_BUTTON_XPATH}		//*[text() ='Gracze' or text()='Players']

${LANGUAGE_BUTTON_XPATH}		//*[text() ='English' or text()='Polski']
${SIGN_OUT_BUTTON_XPATH}		//*[text() ='Wyloguj' or text()='Sign out']

${EDIT_CERTAIN_PLAYER_BUTTON_XPATH}		//ul[2]/div[1]/div[2]/span
${LAST_ADDED_PLAYER_BUTTON_XPATH}		//*/div[3]/div/div/a[1]/button
${ADD_PLAYER_BUTTON_XPATH}        //*/div[2]/div/div/a/button

${EMAIL_FIELD_PLAYER_XPATH}		//*[@name='email']
${NAME_FIELD_XPATH}		//*[@name='name']
${SURNAME_FIELD_XPATH}		//*[@name='surname']
${PHONE_FIELD_XPATH}		//*[@name='phone']
${WEIGHT_VALUE_FIELD_XPATH}		//*[@name='weight']
${HEIGHT_VALUE_FIELD_XPATH}		//*[@name='height']
${BIRTH_DATE_FIELD_XPATH}		//*[@name='age']
${LEG_OPTION_BUTTON_XPATH}		//*[@id='mui-component-select-leg']
${LEG_CHOICE_RIGHT_XPATH}		//*[@data-value='right']
${CLUB_FIELD_XPATH}		//*[@name='club']
${LEVEL_FIELD_XPATH}		//*[@name='level']
${MAIN_POSITION_FIELD_XPATH}		//*[@name='mainPosition']
${SECOND_POSITION_FIELD_XPATH}		//*[@name='secondPosition']
${DISTRICT_OPTION_BUTTON_XPATH}		//*[@id='mui-component-select-district']
${DISTRICT_CHOICE_LOWER_SILESIA_XPATH}		//*[@data-value='dolnoslaskie']
${ACHIEVEMENTS_FIELD_XPATH}		//*[@name='achievements']
${LANGUAGE_PLAYER_BUTTON_XPATH}        //*[@aria-label='Add language']
${LANGUAGE_PLAYER_FIELD_XPATH}		//*[@name='languages[0]']
${LANGUAGE_PLAYER_FIELD_1_XPATH}		//*[@name='languages[1]']
${LACZY_NAS_PILKA_FIELD_XPATH}		//*[@name='webLaczy']
${MINUT_90_FIELD_XPATH}		//*[@name='web90']
${FB_FIELD_XPATH}		//*[@name='webFB']
${YOUTUBE_BUTTON_XPATH}		//*[@aria-label='Add link to Youtube']
${YOUTUBE_FIELD_XPATH}		//*[@name='webYT[0]']
${SUBMIT_BUTTON_XPATH}		//*[@type='submit']

# data

${E-MAIL_USER}		user06@getnada.com
${PASSWORD}		Test-1234
${E-MAIL_PLAYER}		APkhuhyugb@gmail.com
${NAME}    Angelino
${SURNAME}    Pomelino
${PHONE}		12345623456
${WEIGHT_VALUE}		70
${HEIGHT_VALUE}		170
${BIRTH_DATE}		03.09.2003

${CLUB}		APtfxfghjk
${LEVEL}		APokjgjgfg5hkkj
${MAIN POSITION}		APany
${SECOND_POSITION}		APstillany

${ACHIEVEMENTS}		none
${LANGUAGE_PLAYER}		French
${LACZY_NAS_PILKA}		APaleocochodzi
${MINUT_90}		APaleocochodzistill
${FB}		none
${YOUTUBE}		https://www.youtube.com/watch?v

*** Test Cases ***
FIlling in the Add player form
    Open login page
    Type in email
    Type in password
    Submit button
    Click on the Add player button
    Fill in the form and submit
    Go to main page
    [Teardown]      Close Browser

*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   ${E-MAIL_USER}
Type in password
    Input Text       ${PASSWORDINPUT}   ${PASSWORD}
Submit button
    Click Element   ${SIGNINBUTTON}
    wait until element is visible    ${PAGELOGO}
Click on the Add player button
    Click Element    ${ADD_PLAYER_BUTTON_XPATH}
    wait until element is visible    ${FORM_HEADER}
    Title Should Be    Add player
Fill in the form and submit
    Click Element    ${DISTRICT_OPTION_BUTTON_XPATH}
    Wait Until Element Is Visible    ${DISTRICT_CHOICE_LOWER_SILESIA_XPATH}
    Wait Until Element Is Enabled    ${DISTRICT_CHOICE_LOWER_SILESIA_XPATH}
    Click Element    ${DISTRICT_CHOICE_LOWER_SILESIA_XPATH}
    Input Text    ${EMAIL_FIELD_PLAYER_XPATH}    ${E-MAIL_PLAYER}
    Input Text    ${NAME_FIELD_XPATH}    ${NAME}
    Input Text    ${SURNAME_FIELD_XPATH}    ${SURNAME}
    Input Text    ${PHONE_FIELD_XPATH}    ${PHONE}
    Input Text    ${WEIGHT_VALUE_FIELD_XPATH}    ${WEIGHT_VALUE}
    Input Text    ${HEIGHT_VALUE_FIELD_XPATH}    ${HEIGHT_VALUE}
    Input Text    ${BIRTH_DATE_FIELD_XPATH}    ${BIRTH_DATE}
    Click Element    ${LEG_OPTION_BUTTON_XPATH}
    wait until element is visible    ${LEG_CHOICE_RIGHT_XPATH}
    Click Element    ${LEG_CHOICE_RIGHT_XPATH}
    Input Text    ${CLUB_FIELD_XPATH}    ${CLUB}
    Input Text    ${LEVEL_FIELD_XPATH}    ${LEVEL}
    Input Text    ${MAIN_POSITION_FIELD_XPATH}    ${MAIN POSITION}
    Input Text    ${SECOND_POSITION_FIELD_XPATH}    ${SECOND_POSITION}
    Input Text    ${ACHIEVEMENTS_FIELD_XPATH}    ${ACHIEVEMENTS}
    Click Element    ${LANGUAGE_PLAYER_BUTTON_XPATH}
    Input Text    ${LANGUAGE_PLAYER_FIELD_XPATH}    ${LANGUAGE_PLAYER}
    Input Text    ${LACZY_NAS_PILKA_FIELD_XPATH}    ${LACZY_NAS_PILKA}
    Input Text    ${MINUT_90_FIELD_XPATH}    ${MINUT_90}
    Input Text    ${FB_FIELD_XPATH}    ${FB}
    Click Element    ${YOUTUBE_BUTTON_XPATH}
    Input Text    ${YOUTUBE_FIELD_XPATH}    ${YOUTUBE}
    Click Element    ${SUBMIT_BUTTON_XPATH}
    Wait Until Element Is Enabled    ${MAIN_PAGE_XPATH}
    Capture Page Screenshot    picture.png




Go to main page
    Wait Until Element Is Enabled    ${MAIN_PAGE_XPATH}
    Click Element    ${MAIN_PAGE_XPATH}
    Sleep    2s
    Capture Page Screenshot    alert.png







