class TasksController < ApplicationController
    # before_action :login_necessario
    # before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = Task.all
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
            redirect_to tasks_path, notice: "Task foi criada."
        else
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
        @task.destroy
        redirect_to tasks_path, notice: "Task foi destruída."
    end

    private

    def task_params
        params.require(:task).permit(:title, :description)
    end

    def login_necessario
        unless session[:user_id]
            redirect_to login_path, notice: "Voce deve estar logado para continuar!"
        end
    end
end