class TaskController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_filter, only: [:index]

  def index
    @tasks = Task.order('id ASC') if !@project
    @tasks = @project.tasks.order('id ASC') if @project
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
    respond_with(@task)
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Task was successfully created.'
      respond_with(@task, location: @task)
    else
      flash[:error] = @task.errors.full_messages
      respond_with(@task.errors.full_messages, location: new_task_path)
    end
  end

  def update
    if @task.update_attributes(task_params)
      flash[:notice] = 'Task was successfully updated.'
      respond_with(@task, location: @task)
    else
      flash[:error] = @task.errors.full_messages
      respond_with(@task.errors.full_messages, location: edit_task_path(@task))
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = 'Task was successfully destroyed.'
      respond_with(nil, location: task_index_path)
    else
      flash[:error] = @task.errors.full_messages
      respond_with(@task.errors.full_messages,location: task_index_path)
    end
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :project_id)
  end

  def set_filter
    @project = Project.find_by(id: params[:project_id]) if params[:project_id]
  end
end
