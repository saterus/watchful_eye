class Employee < ActiveRecord::Base

  has_one :credential, inverse_of: :employee, dependent: :destroy
  has_many :time_entries, inverse_of: :employee, dependent: :destroy

  delegate :email, :confirmed?, to: :credential

  validates :name, presence: true, length: { in: 1..255 }

end
