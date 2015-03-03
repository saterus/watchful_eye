class Project < ActiveRecord::Base

  has_many :time_entries, inverse_of: :project, dependent: :destroy

end
