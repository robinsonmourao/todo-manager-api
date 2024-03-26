class SessionsController < ApplicationController
    #before_action :login, only: [:login]
    
    def new
    end

    def login
        user = User.find_by(email: params[:email])
        if user
# Rails.logger.warn(user)
            if user.authenticate(params[:password_digest])
                session[:user_id] = user.id
                redirect_to tasks_path, notice: "Bemvindo "+user.username+"!"
            elsif
                redirect_to tasks_path, notice: "Loguinhado com sucesso!"
            end

        elsif
            render :new, notice: "Email: "+params[:email]+" inválido!"
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path, "Voce foi desconectado!"
    end
end