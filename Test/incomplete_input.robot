*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***
${DELAY}          1

*** Test Cases ***
Open Form
    Open Browser To Form Page

Empty Destination
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    ${EMPTY}
    Input Contact    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Submit Form
    Should Show Error About Empty Destination

Open Form
    Open Browser To Form Page

Empty Email
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact    Sodsai Sandee
    Input Relationship    Mother
    Input Email    ${EMPTY}
    Input Phone    081-111-1234
    Submit Form
    Should Show Error About Empty Email

Open Form
    Open Browser To Form Page

Invalid Email
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@
    Input Phone    081-111-1234
    Submit Form
    Should Show Error About Invalid Email

Open Form
    Open Browser To Form Page

Empty Phone Number
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    ${EMPTY}
    Submit Form
    Should Show Error About Empty Phone

Open Form
    Open Browser To Form Page

Invalid Phone Number
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    191
    Submit Form
    Should Show Error About Invalid Phone