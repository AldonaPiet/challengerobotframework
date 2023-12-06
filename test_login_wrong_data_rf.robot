*** Settings ***
Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${E-MAIL_USER}		user06@getnada.com
${PASSWORD}        hgsgst-1234
${PAGELOGO}     xpath=//*/header/div/h6


*** Test Cases ***
Login to the system wrong password
    Open login page
    Type in email
    Type in wrong password
    Click on the signin button
    Assert dashboard
    [Teardown]      Close Browser
*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   ${E-MAIL_USER}
Type in wrong password
    Input Text       ${PASSWORDINPUT}   ${PASSWORD}
Click on the Signin button
    Click Element   ${SIGNINBUTTON}
    Capture Page Screenshot     alert.png
Assert dashboard
    wait until element is visible    ${PAGELOGO}
    title should be     Scouts panel
    Capture Page Screenshot     alert.png
