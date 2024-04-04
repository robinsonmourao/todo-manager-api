class SignupPage < SitePrism::Page

    set_url 'http://127.0.0.1:3000/signup'

    element :username_text_box, '#user_username'
    element :email_text_box, '#user_email'
    element :password_text_box, '#user_password'
    element :signup_button, '#signup-submit-button'

    def signup(username, email, password)

        username_text_box.set username
        email_text_box.set email
        password_text_box.set password
        signup_button.click
    end
end