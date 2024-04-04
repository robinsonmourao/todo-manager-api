class SessionsController < ApplicationController
    #before_action :login, only: [:login]

    # Sessions não estão tendo validade de 30 minutos
    # loggout sem estar logado quebra aplicação
    # Se não fizer logout antes de fazer signup, ao fazer signup ele abre as tarefas do usuario anterior
    # Botoes não sao encontrados pelo cucumber em responsividade menor

    def new
        @session = Session.new
    end

    def login
        user = User.find_by(email: params[:session][:email])

        if user            
            if user.authenticate(params[:session][:password])

                session[:user_id] = user.id

                @session = Session.new
                @session.active = true
                @session[:user_id] = user.id
                @session[:token] = "#{user.id} #{user.username} #{user.email} #{user.password_digest}"

                @session.save
                @session[:expires_at] = setSessionTime()
                @session = Session.find_by(user_id: current_user.id)
                Rails.logger.info("#######, #{@session.inspect}")

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

        @session = Session.find_by(user_id: current_user.id)
        
        if @session
            Rails.logger.info("#######, #{@session.inspect}")
            Rails.logger.info("#######, #{@session.inspect}")
            session[:user_id] = nil
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
        
        expiration = @session.created_at + 1.minutes
        @session[:expires_at] = expiration
        @session.save
    end
end