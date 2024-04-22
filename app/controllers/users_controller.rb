class UsersController < ApplicationController
  before_action :check_expired_sessions
  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if check_taken_credentials(@user) || check_unacceptable_password_length(@user)
      return
    end

    begin
      @user.save
      if @user.authenticate(params[:user][:password])

        session[:user_id] = @user.id
        store_session(@user)

        redirect_to tasks_path, notice: "Bem-vindo, #{@user.username}!"
      end
    rescue StandardError => e
      redirect_to root_path, notice: "Erro ao armazenar usuário: #{e.message}"
    end
  end

  def account_overview
    if current_user.present?
      current_user
    else
      redirect_to login_path, notice: 'Não é possivel gerenciar sua conta sem estar logado!'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user && current_user.authenticate(params[:user][:current_password])
      if @user.update(user_params)
        redirect_to account_path, notice: 'Seus dados foram atualizados!'
      else
        redirect_to account_path, notice: 'Não foi possível atualizar seus dados!'
      end
    else
      redirect_to account_path, notice: 'Senha original inválida!'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user && current_user.authenticate(params[:user][:current_password])
      if @user
        if @user.destroy
          redirect_to root_path, notice: 'Sua conta e tarefas foram eliminadas de forma definitiva. Para gerenciar novas tarefas crie outra conta.'
        end
      else
        redirect_to account_path, notice: 'Não foi possível excluir sua conta!'
      end
    else
      redirect_to account_path, notice: 'Senha incorreta!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def check_taken_credentials(new_user)
    user_by_username = User.find_by(username: new_user[:username])
    user_by_email = User.find_by(email: new_user[:email])

    print(user_by_email.inspect)

    if user_by_username.present? && !user_by_email.present?
      redirect_to new_user_path, notice: "Nome de usuário: #{new_user[:username]} já está em uso. Por favor, escolha outro."
    elsif user_by_email.present? && !user_by_username.present?
      redirect_to new_user_path, notice: "Email de usuário: #{new_user[:email]} já está em uso. Por favor, escolha outro."
    elsif user_by_email.present? && user_by_username.present?
      redirect_to new_user_path, notice: "Nome de usuário: #{new_user[:username]} e Email de usuário: #{new_user[:email]} já está em uso. Por favor, escolha outro."
    else
      false
    end
  end

  def check_unacceptable_password_length(new_user)
    password_length = new_user.password.length

    if password_length < 8
      redirect_to root_path, notice: 'Não é aceito senha menor que 8 caracteres'
    elsif password_length > 12
      redirect_to root_path, notice: 'Não é aceito senha maior que 12 caracteres'
    else
      false
    end
  end
end
