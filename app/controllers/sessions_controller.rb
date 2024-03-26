class SessionsController < ApplicationController
    #before_action :login, only: [:login]
    
    def new
        @session = Session.new
    end

    def login
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password_digest])
            session[:user_id] = user.id
            redirect_to tasks_path, notice: "Bem-vindo, #{user.username}!"
        else
            notice: "Email ou senha inválidos!"
            render :new
        end
    end
    

    def logout
        session[:user_id] = nil
        # session.destroy
        redirect_to root_path, "Voce foi desconectado!"
    end
end