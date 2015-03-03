class Registration

  include ActiveModel::Model

  attr_accessor :email, :name, :password

  validates_presence_of :name, :email, :password
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_confirmation_of :password
  validates_length_of :password, within: 8..128, allow_blank: true
  validate :uniqueness_of_email

  def save!
    if valid?
      Employee.transaction do
        employee = Employee.create!(name: name)
        employee.create_credential!(email: email, password: password)
        employee
      end
    end
  end


  private

  def uniqueness_of_email
    errors.add(:email, 'has already been taken') if Credential.exists?(email: email)
  end

end
