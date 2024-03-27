class TasksController < ApplicationController
    before_action :require_login
    # before_action :set_task, only: [:show, :edit, :update, :destroy]

    # e as tarefas estão sendo criadas de maneira geral, ou seja, 
    # task criada no userA impossibilitará cirar outra com mesmo title mesmo logado com userB

    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
            @tasks = @user.user_tasks.map(&:task)
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
        if @task.save
            user = User.find_by(id: session[:user_id])
            @user_tasks = UserTask.new(user_id: current_user.id, task_id: @task.id)
            @user_tasks.save
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
        @user_tasks = UserTask.find_by(task_id: @task.id)
        
        if @user_tasks && @task

            @user_tasks.destroy
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