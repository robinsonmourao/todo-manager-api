Given('que eu tenha cadastrado previamente um usuário.') do |table|

    @email = table.rows_hash['email']
    @password = table.rows_hash['password']
    visit('http://127.0.0.1:3000/login')

    # @login_page = LoginPage.new
    login_page_helper.load
end

When('eu faço login.') do

    login_page_helper.login('bob.info.guaratiba@gmail.com', '12345678')
    # fill_in 'session_email', with: @email
    # fill_in 'session_password', with: @password
    # # click_button "Login"
    # find("#user-login-button").click
    # sleep(1)
end

Then('Com usuário de nome {string} logado eu acesso a tela de tarefas.') do |username|

    expect(page).to have_current_path('http://127.0.0.1:3000/tasks', url: true)
    @actual_user = find('div[id="notice"]')
    expect(@actual_user.text).to eql "Bem-vindo, #{username}!"
end