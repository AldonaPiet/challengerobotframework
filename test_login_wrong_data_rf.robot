*** Settings ***
Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website
*** Variables ***
${LOGIN URL}        https://dareit.futbolkolektyw.pl/en
#${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
#xpath
${SIGNINBUTTON}     xpath=//span[@class='MuiButton-label']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}      xpath=//*/header/div/h6
${invalid_password_or_id}    xpath=//*/div[3]/span
#data
${EMAIL_USER}		user06@getnada.com
${PASSWORD_WRONG}        hgsgst-1234




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
    Maximize Browser Window
# asserty wyłączone na production, zostawione tylko na końcu o ile potrzebne
#    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   ${EMAIL_USER}
Type in wrong password
    Input Text       ${PASSWORDINPUT}   ${PASSWORD_WRONG}
Click on the Signin button
    Click Element   ${SIGNINBUTTON}
    Wait Until Element Is Visible    ${invalid_password_or_id}
    Capture Page Screenshot     picture.png
#do tego momentu test pozytywny, poniżej - sprawdzam czy przechodzi do następnej strony - test negatywny
Assert dashboard
    wait until element is visible    ${PAGELOGO}
    title should be     Scouts panel
    Capture Page Screenshot     alert.png
