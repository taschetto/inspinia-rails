class ProjectController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_filter, only: [:index]

  def index
    @projects = Project.order('id ASC') if !@organization
    @projects = @organization.projects.order('id ASC') if @organization
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
    respond_with(@project)
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = 'Project was successfully created.'
      respond_with(@project, location: @project)
    else
      flash[:error] = @project.errors.full_messages
      respond_with(@project.errors.full_messages, location: new_project_path)
    end
  end

  def update
    if @project.update_attributes(project_params)
      flash[:notice] = 'Project was successfully updated.'
      respond_with(@project, location: @project)
    else
      flash[:error] = @project.errors.full_messages
      respond_with(@project.errors.full_messages, location: edit_project_path(@project))
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = 'Project was successfully destroyed.'
      respond_with(nil, location: project_index_path)
    else
      flash[:error] = @project.errors.full_messages
      respond_with(@project.errors.full_messages,location: project_index_path)
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :budget, :block, :organization_id)
  end

  def set_filter
    @organization = Organization.find_by(id: params[:organization_id]) if params[:organization_id]
  end
end
