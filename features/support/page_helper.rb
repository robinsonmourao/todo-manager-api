Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }
                    
module Pages
    def signup_page_helper
        @signup_page ||= SignupPage.new
    end
    def login_page_helper
        @login_page ||= LoginPage.new
    end
    def tasks_page_helper
        @tasks_page ||= TasksPage.new
    end    
end