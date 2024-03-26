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
            redirect_to tasks_path, notice: "Seja bem vindo!"
        else
            # Se houver erro de validação devido ao nome de usuário duplicado
            if @user.errors[:username].include?("has already been taken")
              flash[:error] = "Nome de usuário já está em uso. Por favor, escolha outro."
            end
            render 'new'
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password_digest)
    end
end