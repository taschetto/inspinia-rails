class ProjectController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user!
  before_action :set_organization, only: [:index, :new, :create]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if @organization
      @projects = @organization.projects.order('id ASC')
    else
      @projects = Project.order('id ASC')
    end
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    @project.organization = @organization
    respond_with(@project)
  end

  def edit
    respond_with(@project)
  end

  def create
    @project = Project.new(project_params)
    @project.organization = @organization

    if @project.save
      flash[:notice] = 'Project was successfully created.'
      respond_with(@project, location: @project)
    else
      flash[:error] = @project.errors.full_messages
      respond_with(@project.errors.full_messages, location: new_organization_project_path(@organization))
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
    organization = @project.organization
    if @project.destroy
      flash[:notice] = 'Project was successfully destroyed.'
      respond_with(nil, location: organization_project_index_path(organization))
    else
      flash[:error] = @project.errors.full_messages
      respond_with(@project.errors.full_messages,location: organization_project_index_path(organization))
    end
  end

  private

  def set_organization
    @organization = Organization.find_by(id: params[:organization_id]) if params[:organization_id]
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :budget, :block)
  end
end
