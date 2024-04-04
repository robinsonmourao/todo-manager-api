# language: en

Feature: Cadastrar usuário

-Eu como usuário.
-Quero me cadastrar no sistema.

Scenario: Fazer cadastro de usuário com sucesso

    Given que eu acesse o sistema pela primeira vez
        |username|Robinson|
        |email|bob.info.guaratiba@gmail.com|
        |password|12345678|

    When eu inserir dados cadastrais
    Then eu verifico se posso logar com nome "Robinson".
