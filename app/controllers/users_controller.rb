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
      @notice = 'Nome de usuário já está em uso. Por favor, escolha outro.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
