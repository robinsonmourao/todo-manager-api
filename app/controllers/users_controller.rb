class UsersController < ApplicationController
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
    if @user.save
      if @user.authenticate(params[:user][:password])

        session[:user_id] = @user.id
        store_session(@user)

        redirect_to tasks_path, notice: "Bem-vindo, #{@user.username}!"
      end
    else
      redirect_to new_user_path, notice: 'Nome de usuário já está em uso. Por favor, escolha outro.'
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
    if @user.update(user_params)
      redirect_to account_path, notice: 'Seus dados foram atualizados!'
    else
      redirect_to account_path, notice: 'Não foi possível atualizar seus dados!'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      if @user.destroy
        redirect_to root_path, notice: 'Sua conta e tarefas foram eliminadas de forma definitiva. Para gerenciar novas tarefas crie outra conta.'
      end
    else
      redirect_to user_path, notice: 'Não foi possível excluir sua conta!'
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
