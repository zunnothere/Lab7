*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        chrome
${DELAY}          0
${FIRSTNAME}      Somsong
${LASTNAME}       Sandee
${DESTINATION}    Europe
${CONTACT}        Sodsai Sandee
${RELATIONSHIP}   Mother
${EMAIL}          somsong@kkumail.com
${PHONE}          081-111-1234
${FORM_URL}       http://${SERVER}/Form.html
${COMPLETE_URL}   http://${SERVER}/Complete.html
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}..${/}ChromeForTesting${/}chrome${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}..${/}ChromeForTesting${/}chromedriver${/}chromedriver.exe

*** Keywords ***
Open Browser To Form Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${FORM_URL}

Input First Name
    [Arguments]    ${FIRSTNAME}
    Input Text    firstname    ${FIRSTNAME}

Input Last Name
    [Arguments]    ${LASTNAME}
    Input Text    lastname    ${LASTNAME}

Input Destination
    [Arguments]    ${DESTINATION}
    Input Text    destination    ${DESTINATION}

Input Contact
    [Arguments]    ${CONTACT}
    Input Text    contactperson    ${CONTACT}

Input Relationship
    [Arguments]    ${RELATIONSHIP}
    Input Text    relationship    ${RELATIONSHIP}

Input Email
    [Arguments]    ${EMAIL}
    Input Text    email    ${EMAIL}

Input Phone
    [Arguments]    ${PHONE}
    Input Text    phone    ${PHONE}

Submit Form
    Click Button    submitButton

Complete Page Should Be Open
    Location Should Be    ${COMPLETE_URL}
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.

Should Show Error About Empty Destination
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter your destination.

Should Show Error About Empty Email
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter a valid email address.

Should Show Error About Invalid Email
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter a valid email address.

Should Show Error About Empty Phone
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter a phone number.

Should Show Error About Invalid Phone
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)