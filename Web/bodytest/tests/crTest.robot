*** Settings ***
Documentation   	Test suite created with ChromeRobot.
Library   	SeleniumLibrary   15.0   5.0

*** Variables ***
${Browser}   	Chrome
${gestão_de_alunos_locator}   	xpath:.//h1[contains(normalize-space(.), 'Gestão de Alunos')]
${seu_e-mailsua_senhaentrar_locator}   	xpath:(.//div[contains(normalize-space(.), 'SEU E-MAILSUA SENHAEntrar')])[last()]
${bodytest_locator}   	bodytest

*** Test Cases ***
Chrome Robot Test Case

	Open Browser  	https://bodytest-web-scparis.herokuapp.com/   	${BROWSER}
	Page Should Contain   	SEU E-MAIL
	Page Should Contain   	SUA SENHA
	Page Should Contain   	Entrar

	Page Should Contain Image   	${bodytest_locator}
