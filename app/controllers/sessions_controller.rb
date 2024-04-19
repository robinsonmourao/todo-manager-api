class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def login
    @user = User.find_by(email: params[:session][:email])

    check_previous_sessions(@user)

    if @user && params[:session].present?
      if @user.authenticate(params[:session][:password])
        store_session(@user)
        redirect_to tasks_path, notice: "Bem-vindo, #{@user.username}!"
      else
        redirect_to login_path, notice: 'Senha inválida!'
      end
    else
      redirect_to login_path, notice: 'Email inválido!'
    end
  end

  def logout
    if current_user.present?
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
    else
      redirect_to login_path, notice: 'Não é possivel fazer logout sem estar logado!'
    end
  end
end
