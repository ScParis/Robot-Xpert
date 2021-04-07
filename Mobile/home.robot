***Settings***

Library         AppiumLibrary

# {
#   "automationName": "UiAutomator2",
#   "platformName": "Android",
#   "deviceName": "Emulator",
#   "app": "/media/scparis/HD1/Cursos/Automação de teste/Robot-Xpert/Robot-Xpert/Mobile/app/twp.apk",
#   "udid": "emulator-5554"
# }

***Test Cases***
Deve abrir a tela principal
    Open Application                http://localhost:4723/wd/hub
    ...                             automationName=UiAutomator2
    ...                             platformName=Android
    ...                             deviceName=Emulator
    ...                             app=${EXECDIR}/app/twp.apk

    Wait Until Page Contains        Training Wheels Protocol        10
    Wait Until Page Contains        Mobile Version                  10

    Close Application
