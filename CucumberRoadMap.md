# Preparar ambiente
## Install Cucumber

`mkdir cucumber_tests`
`cd cucumber_tests`
`sudo gem install cucumber`

# Iniciar Cucumber

`cucumber --init`

# Instalar gems necessárias

`mkdir <pasta-root-de-testes>/Gemfile`
```
source 'http://rubygems.org'

gem 'capybara'
gem 'chromedriver-helper'
gem 'cucumber'
gem 'rspec'
gem 'robocop'
gem 'selenium-webdriver'
gem 'site_prism'
gem 'fastri'
gem 'rcodetools' 
```
`bundle install --gemfile=<pasta-root-de-testes>/Gemfile`

# Configurando enviroment

`cd <pasta-root-de-testes>/support/env.rb`
```
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'rspec'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

Capybara.register_driver :selenium do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-infobars')
    options.add_argument('window-size=1366x768')

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 30
    config.app_host = 'http://http://127.0.0.1:3000/'
end
```

# Instale RSpec

```
gem install rspec
```

# Crie a funcionalidade login

`mkdir <pasta-root-de-testes>/features/specs/login.feature`
```
# language: en

Feature: Fazer login

-Eu como usuário.
-Quero fazer login.

Scenario: Fazer login com sucesso.

    Given que eu tenha cadastrado previamente um usuário.
        |email|bob.info.guaratiba@gmail.com|
        |password|12345678|
    When eu faço login.
    Then eu verifico se consegui logar.
```

# Configure o arquivo de mapeamento para etapas BDD de login

```
cucumber
```
cole o esqueleto no seguinte arquivo:
`mkdir <pasta-root-de-testes>/features/step_definitions/[login.rb]`
```
Given('que eu tenha cadastrado previamente um usuário.') do |table|
  
end

When('eu faço login.') do

end

Then('eu verifico se consegui logar.') do

end
```

# Faça a associação com os dados inseridos de login.feature
## Given

```
Given('que eu tenha cadastrado previamente um usuário.') do |table|
    @email = table.rows_hash['email']
    @password = table.rows_hash['password']
    visit('http://127.0.0.1:3000/login')
end
```

## When

```
When('eu faço login.') do
    fill_in 'session_email', with: @email
    fill_in 'session_password', with: @password
    sleep(5)
end
```

## Then

```
Then('eu verifico se consegui logar.') do

    expect(page).to have_current_path('http://127.0.0.1:3000/tasks', url: true)
    @actual_user = find('div[id="notice"]')
    # expect(@actual_user.text).to eql 'Bem-vindo, '
end
```

# Criar gatilhos after e before

`/features/support/[hooks.rb]`
```
After '@user_logout' do

    click_button "Logout"
    sleep(2)
end
```
