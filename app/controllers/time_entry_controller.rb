class TimeEntryController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :authenticate_user!
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]

  def index
    @time_entries = @user.time_entries.order('starts_at ASC')
    respond_with(@time_entries)
  end

  def show
    respond_with(@time_entry)
  end

  def new
    @time_entry = TimeEntry.new
    @time_entry.user = @user
    respond_with(@time_entry)
  end

  def edit
    respond_with(@time_entry)
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.user = @user

    if @time_entry.save
      flash[:notice] = 'TimeEntry was successfully created.'
      respond_with(@time_entry, location: @time_entry)
    else
      flash[:error] = @time_entry.errors.full_messages
      respond_with(@time_entry.errors.full_messages, location: new_user_time_entry_path)
    end
  end

  def update
    if @time_entry.update_attributes(time_entry_params)
      flash[:notice] = 'TimeEntry was successfully updated.'
      respond_with(@time_entry, location: @time_entry)
    else
      flash[:error] = @time_entry.errors.full_messages
      respond_with(@time_entry.errors.full_messages, location: edit_time_entry_path(@time_entry))
    end
  end

  def destroy
    user = @time_entry.user
    if @time_entry.destroy
      flash[:notice] = 'TimeEntry was successfully destroyed.'
      respond_with(nil, location: user_time_entry_index_path(user))
    else
      flash[:error] = @time_entry.errors.full_messages
      respond_with(@time_entry.errors.full_messages,location: user_time_entry_index_path(user))
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id]) if params[:user_id]
    @user = current_user if !params[:user_id]
  end

  def set_time_entry
    @time_entry = TimeEntry.find_by(id: params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:starts_at, :ends_at, :memo, :task_id)
  end
end