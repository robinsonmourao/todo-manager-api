class TasksController < ApplicationController
    before_action :require_login

    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
            Rails.logger.info("######### #{@user.username}")
            @tasks = current_user.tasks
        else
            redirect_to login_path, notice: "Faça login apra acessar suas tasks!"
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end
    def create

        @task = Task.new(task_params)
        @task.user_id = current_user.id

        if @task.save
            user = User.find_by(id: session[:user_id])
            redirect_to tasks_path, notice: "Task foi criada."
        else
            @notice = "Não foi possivel salvar a tarefa!"
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
    end
    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to tasks_path, notice: "Task foi atualizada."
        elsif
            redirect_to tasks_path, notice: "Não foi possível atualizar a task!"
        end
    end

    def destroy

        @task = Task.find(params[:id])
        
        if @task

            @task.destroy
            redirect_to tasks_path, notice: "Task foi destruída."
        else
            @notice = "Não foi possivel excluir a associação entre user e task"
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :description)
    end

    def require_login
        unless session[:user_id]
            redirect_to login_path, notice: "Voce deve estar logado para continuar!"
        end
    end
end