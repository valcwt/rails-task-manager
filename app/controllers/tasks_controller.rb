class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create

    task = Task.new(task_params)

    task.save

    redirect_to tasks_path(@task)
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    @task.update(task_params)

    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  def complete
     if @task[:completed] = true

    @task.completed = true

   @task.save
   redirect_to tasks_path
  end



  private

  def task_params
    params.require(:task).permit(:title, :detail)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
