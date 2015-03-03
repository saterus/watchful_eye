class Timer < ActiveRecord::Base
  RunningTimerException = Class.new(StandardError)

  belongs_to :time_entry, inverse_of: :timers
  has_one :employee, through: :time_entry

  validates :time_entry, presence: true
  validates :start_time, presence: true

  def stop
    self.end_time = DateTime.now
    time_entry.duration_in_minutes += duration_in_minutes
    save
  end

  def duration_in_minutes
    raise RunningTimerException.new("Timer is not yet stopped!") if end_time.nil?

    ((end_time.to_f - start_time.to_f) / 60).ceil
  end

end
