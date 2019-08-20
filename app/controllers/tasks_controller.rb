# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :fetch_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    # Redirect to the index page
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    # Redirect to the task page
    redirect_to @task
  end

  def destroy
    @task.destroy

    # Redirect to the index page
    redirect_to root_path
  end

  private

  def fetch_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
