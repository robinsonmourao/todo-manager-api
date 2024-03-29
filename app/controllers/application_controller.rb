class ApplicationController < ActionController::Base
    helper_method :current_user, :current_session

    
    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_session
        @current_session ||= Session.find_by(user_id: current_user.id) if session[:user_id]
    end
end
