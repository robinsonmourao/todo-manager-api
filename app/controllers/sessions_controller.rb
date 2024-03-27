class SessionsController < ApplicationController
    #before_action :login, only: [:login]

    # Sessions não estão sendo brickadas do banco de dados, 
    # sugestao, criar uma colula booleana para setar sessao como ativa ou não

    def new
        @session = Session.new
    end

    def login
        user = User.find_by(email: params[:session][:email])

        if user            
            if user.authenticate(params[:session][:password])

                session[:user_id] = user.id

                @session = Session.new
                @session[:user_id] = user.id
                @session[:token] = user.id
                @session[:expires_at] = setSessionTime(@session)

                @session.save
                redirect_to tasks_path, notice: "Bem-vindo, #{user.username}!"
            else
                @notice = "Senha inválida!"
                render :new
            end
        else
            @notice = "Email inválido!"
            render :new
        end
    end    

    def logout
        session[:user_id] = nil
        session = Session.find_by(id: params[:id])
        if session
            session.destroy
            redirect_to root_path, notice: "Voce foi desconectado!"
        else
            redirect_to tasks_path, notice: "Sessao nao encontrada!"
        end
    end


    private

    def session_params
        params.require(:session).permit(:user_id, :expires_at)
    end

    def setSessionTime(session)
        created_at = Time.parse("2024-03-27 13:28:00.695022")
        expiration = created_at + 30.minutes
        session[:expires_at] = expiration
    end
end