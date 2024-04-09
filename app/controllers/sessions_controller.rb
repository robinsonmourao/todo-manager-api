class SessionsController < ApplicationController
  # before_action :login, only: [:login]

  # Sessions não estão tendo validade de 30 minutos
  # loggout sem estar logado quebra aplicação
  # Se não fizer logout antes de fazer signup, ao fazer signup ele abre as tarefas do usuario anterior

  def new
    @session = Session.new
  end

  def login
    @user = User.find_by(email: params[:session][:email])
    if @user
      if @user.authenticate(params[:session][:password])
        store_session(@user)
        redirect_to tasks_path, notice: "Bem-vindo, #{@user.username}!"
      else
        @notice = 'Senha inválida!'
        render :new
      end
    else
      @notice = 'Email inválido!'
      render :new
    end
  end

  def logout
    # ja que ele busca pelo id de usuário e as sessoes nao sao destruidas,
    # a busca sempre vai retornar a primeira sessão do usuário atual
    db_session = Session.find_by(user_id: current_user.id)

    if db_session
      session[:user_id] = nil

      db_session[:active] = 0
      db_session.save

      redirect_to root_path, notice: 'Você foi desconectado!'
    else
      redirect_to tasks_path, notice: 'Sessão não encontrada!'
    end
  end

  private

  def session_params
    params.require(:session).permit(:user_id, :expires_at)
  end
end
