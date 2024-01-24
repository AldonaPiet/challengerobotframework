*** Settings ***
Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*/header/div/h6

${EXPECTED_TITLE_SIGN_IN}     Scouts panel - sign in
${EMAIL_USER}        user06@getnada.com
${PASSWORD_USER}        Test-1234
${PASSWORD_WRONG}        hgsgst-1234
${EXPECTED_TITLE_DASHBOARD}        Scouts panel


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]      Close Browser
*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Title Should Be     ${EXPECTED_TITLE_SIGN_IN}
Type in email
    Input Text      ${EMAILINPUT}   ${EMAIL_USER}
Type in password
    Input Text       ${PASSWORDINPUT}   ${PASSWORD_USER}
Click on the Submit button
    Click Element  ${SIGNINBUTTON}
Assert dashboard
    wait until element is visible    ${PAGELOGO}
    title should be     ${EXPECTED_TITLE_DASHBOARD}
    Capture Page Screenshot     alert.png





