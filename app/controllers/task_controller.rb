class TaskController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user!
  before_action :set_project, only: [:index, :new, :create]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if @project
      @tasks = @project.tasks.order('id ASC')
    else
      @tasks = Task.order('id ASC')
    end
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    @task.project = @project
    respond_with(@task)
  end

  def edit
    respond_with(@task)
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project

    if @task.save
      flash[:notice] = 'Task was successfully created.'
      respond_with(@task, location: @task)
    else
      flash[:error] = @task.errors.full_messages
      respond_with(@task.errors.full_messages, location: new_project_task_path)
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
    project = @task.project
    if @task.destroy
      flash[:notice] = 'Task was successfully destroyed.'
      respond_with(nil, location: project_task_index_path(project))
    else
      flash[:error] = @task.errors.full_messages
      respond_with(@task.errors.full_messages,location: project_task_index_path(project))
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id]) if params[:project_id]
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
