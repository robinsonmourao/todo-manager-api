class TasksPage < SitePrism::Page

    set_url = 'http://127.0.0.1:3000/tasks'

    # element :wellcome_username, '#notice'
    element :logout_button, '#logout-button'

    def logout
        logout_button.click
    end
end