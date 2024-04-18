class TasksController < ApplicationController
  before_action :require_login, :check_expired_sessions
  before_action :validate_task_ownership, only: [:show, :edit, :destroy]

  def index
    if session[:user_id]
      @tasks = current_user.tasks
    else
      redirect_to login_path, notice: 'Faça login para acessar suas tasks!'
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
      redirect_to tasks_path, notice: 'Task foi criada.'
    else
      @notice = 'Não foi possivel salvar a tarefa!'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path, notice: 'Task foi atualizada.'
    else
      redirect_to tasks_path, notice: 'Não foi possível atualizar a task!'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task

      @task.destroy
      redirect_to tasks_path, notice: 'Task foi destruída.'
    else
      @notice = 'Não foi possivel excluir a task'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def require_login
    unless session[:user_id] && current_user
      redirect_to login_path, notice: 'Você deve estar logado para continuar!'
    end
  end

  def validate_task_ownership
    unless current_task && (current_user.id == current_task.user_id)
      redirect_to tasks_path, notice: 'Tarefa não encontrada!'
    end
  end
end
