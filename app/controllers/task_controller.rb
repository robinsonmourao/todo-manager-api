class TaskController < ApplicationController
    def index
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path, notice: "Task foi criada!"
        else
            render :new
        end
    end


    private

    def task_params
        params.require(:task).permit(:title, :description)
    end

end