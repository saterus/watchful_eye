class TimeEntry < ActiveRecord::Base

  belongs_to :task, inverse_of: :time_entries
  belongs_to :project, inverse_of: :time_entries
  belongs_to :employee, inverse_of: :time_entries
  has_many :timers, inverse_of: :time_entry, dependent: :destroy

  validates :task, presence: true
  validates :project, presence: true
  validates :employee, presence: true
  validates :date, presence: true
  validates :duration_in_minutes, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def active_timer
    timers.where(end_time: nil).first
  end

end
