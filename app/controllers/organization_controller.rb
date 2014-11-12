class OrganizationController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.order('id ASC')
    respond_with(@organizations)
  end

  def show
    respond_with(@organization)
  end

  def new
    @organization = Organization.new
    respond_with(@organization)
  end

  def edit
    respond_with(@organization)
  end

  def create
    @organization = Client.new(client_params)

    if @organization.save
      flash[:notice] = 'Organization was successfully created.'
      respond_with(@organization, location: @organization)
    else
      flash[:error] = @organization.errors.full_messages
      respond_with(@organization.errors.full_messages, location: new_organization_path)
    end
  end

  def update
    if @organization.update_attributes(organization_params)
      flash[:notice] = 'Organization was successfully updated.'
      respond_with(@organization, location: @organization)
    else
      flash[:error] = @organization.errors.full_messages
      respond_with(@organization.errors.full_messages, location: edit_organization_path(@organization))
    end
  end

  def destroy
    if @organization.destroy
      flash[:notice] = 'Organization was successfully destroyed.'
      respond_with(nil, location: organization_index_path)
    else
      flash[:error] = @organization.errors.full_messages
      respond_with(@organization.errors.full_messages,location: organization_index_path)
    end
  end

  private

  def set_organization
    @organization = Organization.find_by(id: params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :fullname, :cnpj, :address1, :address2, :address3, :zipcode, :city, :state, :country, :website, :primary_email)
  end
end
