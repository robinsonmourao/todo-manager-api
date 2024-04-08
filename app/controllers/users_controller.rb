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

        @session = Session.new
        @session.active = true
        @session[:user_id] = @user.id
        @session[:token] = "#{@user.id} #{@user.username} #{@user.email} #{@user.password_digest}"

        @session.save
        @session[:expires_at] = session_time(@session)
        @session = Session.find_by(user_id: current_user.id)
        Rails.logger.info("#######, #{@session.inspect}")

        redirect_to tasks_path, notice: "Bem-vindo, #{@user.username}!"
      end
    else
      @notice = "Nome de usuário já está em uso. Por favor, escolha outro."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def session_time(session)
    expiration = session.created_at + 1.minutes
    session[:expires_at] = expiration
    session.save
  end
end
