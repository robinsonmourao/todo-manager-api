class UserTasksController < ApplicationController
    def create
        @user_task = User_task(user_task_params)
    end

    private

    def user_tasks_params
        params.require(:task).permit(:user_id, :task_id)
    end
end