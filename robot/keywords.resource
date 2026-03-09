*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/CustomKeywords.py

*** Variables ***
# URL and browser
${URL}    https://www.saucedemo.com/
${BROWSER}    firefox

# Login locators
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}    id=login-button
${ERROR_MSG}    css:*[data-test="error"]

# Shop locators
${BACKPACK_ADD_TO_CART_BUTTON}    id=add-to-cart-sauce-labs-backpack
${CART_ICON}    css:.shopping_cart_link
${CHECKOUT_BUTTON}    id=checkout

# Checkout locators
${FIRST_NAME_FIELD}    id=first-name
${LAST_NAME_FIELD}    id=last-name
${ZIP_CODE_FIELD}    id=postal-code
${CONTINUE_BUTTON}    id=continue
${FINISH_BUTTON}    id=finish
${ITEM_NAME_TEXT}    css:.inventory_item_name
${ITEM_PRICE_TEXT}    css:.inventory_item_price

*** Keywords ***
Execute Successful Purchase
    [Arguments]    ${username}

    Click Button    ${BACKPACK_ADD_TO_CART_BUTTON}
    Click Link    ${CART_ICON}
    Click Button    ${CHECKOUT_BUTTON}

    Input Text    ${FIRST_NAME_FIELD}    Tester
    Input Text    ${LAST_NAME_FIELD}    User
    Input Text    ${ZIP_CODE_FIELD}    12345
    Click Button    ${CONTINUE_BUTTON}

    ${item_name}=    Get Text    ${ITEM_NAME_TEXT}
    ${item_price}=    Get Text    ${ITEM_PRICE_TEXT}

    Click Button    ${FINISH_BUTTON}

    Save Purchase To Database    user=${username}    product=${item_name}    price=${item_price}    status=Success