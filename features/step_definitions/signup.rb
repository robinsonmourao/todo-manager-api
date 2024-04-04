Given('que eu acesse o sistema pela primeira vez') do |table|
    @username = table.rows_hash['username']
    @email = table.rows_hash['email']
    @password = table.rows_hash['password']
    visit('http://127.0.0.1:3000/signup')

    signup_page_helper.load
end
  
When('eu inserir dados cadastrais') do
    signup_page_helper.signup('Robinson', 'bob.info.guaratiba@gmail.com', '12345678')
    sleep(3)
end
  
Then('eu verifico se posso logar com nome {string}.') do |username|
    expect(page).to have_current_path('http://127.0.0.1:3000/tasks', url: true)
    @actual_user = find('div[id="notice"]')
    expect(@actual_user.text).to eql "Bem-vindo, #{username}!"
end