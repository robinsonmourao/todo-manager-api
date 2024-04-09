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

    check_previous_sessions(@user)

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
    # Suporta uma sessão simultaneamente
    # Ao sair sem deslogar a sessão fica no banco como ativa
    # Fazer algum esquema que identifique as sessoes expiradas e set db_session[:active] = 0
    db_session = Session.find_by(user_id: current_user.id, active: 1)
    if db_session && db_session.active == true

      session[:user_id] = nil

      db_session[:active] = 0
print(db_session.inspect)

      begin
        db_session.save!
        redirect_to root_path, notice: 'Você foi desconectado!'
      rescue StandardError => e
        flash[:notice] = "Erro ao salvar a sessão: #{e.message}"
        redirect_to root_path
      end
    else
      redirect_to tasks_path, notice: 'Sessão não encontrada!'
    end
  end

  private

  def session_params
    params.require(:session).permit(:user_id, :expires_at)
  end
end
