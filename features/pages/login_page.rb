class LoginPage < SitePrism::Page

    set_url 'http://127.0.0.1:3000/login'

    element :email_text_box, '#session_email'
    element :password_text_box, '#session_password'
    element :login_button, '#user-login-button'

    def login (email, password)

        email_text_box.set email
        password_text_box.set password
        login_button.click
    end
end