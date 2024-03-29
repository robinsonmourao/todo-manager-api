class SessionsController < ApplicationController
    #before_action :login, only: [:login]

    # [OK]Sessions não estão sendo brickadas do banco de dados, 
    # sugestao, criar uma colula booleana para setar sessao como ativa ou não

    # Sessions não estão tendo validade de 30 minutos
    # Ao signup usuário é direcionado para tela de login, ideal: ser direcionado direto para suas tasks

    def new
        @session = Session.new
    end

    def login
        user = User.find_by(email: params[:session][:email])

        if user            
            if user.authenticate(params[:session][:password])

                session[:user_id] = user.id

                current_session = Session.new
                current_session[:user_id] = user.id
                current_session[:token] = "#{user.id} #{user.username} #{user.email} #{user.password_digest}"

                current_session.save
                current_session[:expires_at] = setSessionTime()
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

        current_session = Session.find_by(user_id: current_user.id)
        
        if current_session

            session[:user_id] = nil
            current_session.destroy
            redirect_to root_path, notice: "Voce foi desconectado!"
        else
            redirect_to tasks_path, notice: "Sessao nao encontrada!"
        end
    end


    private

    def session_params
        params.require(:session).permit(:user_id, :expires_at)
    end

    def setSessionTime()
        
        expiration = current_session.created_at + 30.minutes
        current_session[:expires_at] = expiration
        current_session.save
    end
end