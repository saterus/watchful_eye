class Task < ActiveRecord::Base

  has_many :time_entries, inverse_of: :task, dependent: :restrict_with_error

end
