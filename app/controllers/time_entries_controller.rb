class TimeEntriesController < ApplicationController

  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]

  def index
    @time_entries = current_employee.time_entries.all
  end

  def show
  end

  def new
    @time_entry = current_employee.time_entries.build
  end

  def edit
  end

  def create
    @time_entry = current_employee.time_entries.build(time_entry_params)

    if @time_entry.save
      redirect_to @time_entry, notice: 'Time entry was successfully created.'
    else
      render :new
    end
  end

  def update
    if @time_entry.update(time_entry_params)
      redirect_to @time_entry, notice: 'Time entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @time_entry.destroy
    redirect_to time_entries_url, notice: 'Time entry was successfully destroyed.'
  end

  private

  def set_time_entry
    @time_entry = current_employee.time_entries.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:notes, :date, :duration_in_minutes, :task_id, :project_id)
  end

end
