***Settings***

Library         AppiumLibrary

***Test Cases***
Deve abrir a tela principal
    Open Application                        http://localhost:4723/wd/hub
    ...                                     automationName=UiAutomator2
    ...                                     platformName=Android
    ...                                     deviceName=Emulator
    ...                                     app=${EXECDIR}/app/twp.apk

    Wait Until Page Contains                COMEÇAR        10

    Click Text                              COMEÇAR 
    Wait Until Page Contains Element        id=io.qaninja.android.twp:id/toolbarTitle

    Click Element                           xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Wait Until Page Contains                Training Wheels        

    Close Application