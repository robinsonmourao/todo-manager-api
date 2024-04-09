class SessionsController < ApplicationController
  # loggout sem estar logado quebra aplicação
  # Se não fizer logout antes de fazer signup, ao fazer signup ele abre as tarefas do usuario anterior
  # Suporta uma sessão simultaneamente
  # Login com email inválido quebra aplicação, TRATAR

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
        redirect_to login_path, notice: 'Senha inválida!'
      end
    else
      redirect_to root_path, notice: 'Email inválido!'
    end
  end

  def logout
    db_session = Session.find_by(user_id: current_user.id, active: 1)
    if db_session && db_session.active == true

      session[:user_id] = nil

      db_session[:active] = 0

      begin
        db_session.save!
        redirect_to root_path, notice: 'Você foi desconectado!'
      rescue StandardError => e
        redirect_to root_path, notice: "Erro ao salvar a sessão: #{e.message}"
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
