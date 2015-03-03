class Project < ActiveRecord::Base

  has_many :time_entries, inverse_of: :project, dependent: :destroy

  validates :name, presence: true, length: { in: 1..255 }

end
