class TimersController < ApplicationController

  def create
    time_entry = current_employee.time_entries.find(params[:time_entry_id])
    if time_entry.timers.create
      redirect_to time_entries_path(date: time_entry.date.to_date.iso8601), notice: "The timer for #{time_entry.task.name} has started."
    else
      redirect_to time_entries_path(date: time_entry.date.to_date.iso8601), alert: 'Could not start the timer.'
    end
  end

  def update
    timer = current_employee.timers.find(params[:id])
    if timer.stop
      redirect_to time_entries_path(date: timer.time_entry.date.to_date.iso8601), notice: 'The active timer has been stopped.'
    else
      redirect_to time_entries_path(date: timer.time_entry.date.to_date.iso8601), alert: 'The active timer could not be stopped.'
    end
  end

end
