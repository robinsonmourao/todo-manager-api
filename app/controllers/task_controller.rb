class TaskController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def show
        @task = Task.find(params[:id])
    end
      
    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path, notice: "Task foi criada!"
        else
            render :new
        end
    end


    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path, notice: "Task foi destruída!"
    end


    private

    def task_params
        params.require(:task).permit(:title, :description)
    end

end