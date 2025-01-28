*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***
${DELAY}          1

*** Test Cases ***
Open Form
    Open Browser To Form Page

Record Success
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Submit Form
    Complete Page Should Be Open
    [Teardown]    Close Browser