# language: en

Feature: Fazer login

-Eu como usuário.
-Quero fazer login.

@user_logout
Scenario: Fazer login com sucesso.

    Given que eu tenha cadastrado previamente um usuário.
        |email|bob.info.guaratiba@gmail.com|
        |password|12345678|
    When eu faço login.
    Then eu verifico se consegui logar.