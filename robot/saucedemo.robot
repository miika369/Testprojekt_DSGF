*** Settings ***
Library    DataDriver    file=../data/users.csv    encoding=utf-8
Resource    keywords.resource
Test Template    Login and Purchase

*** Test Cases ***
Login as ${username}  Test  Test

*** Keywords ***
Login and Purchase
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login attempt
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Password    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

    TRY
        Execute Successful Purchase  ${username}
    EXCEPT
        Save Purchase To Database  user=${username}  status=Failed
    END

    [Teardown]    Close Browser