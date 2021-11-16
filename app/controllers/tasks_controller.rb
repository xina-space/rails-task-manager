class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def show; end

  def edit; end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
