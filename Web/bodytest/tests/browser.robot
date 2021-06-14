*** Settings ***
Library   Browser
# Library   SeleniumLibrary

*** Test Cases ***
Example Test
    New Page
    Open Browser   https://playwright.dev
    Get Text    h1    contains    Playwright