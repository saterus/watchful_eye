class RegistrationsController < ApplicationController

  respond_to :html

  skip_before_action :authenticate!, only: [:new, :confirm, :create]
  before_action :redirect_authenticated, only: [:new, :create]
  before_action :setup_credential, only: [:confirm]

  def new
    @registration = Registration.new
  end

  def confirm
    @credential.confirm!
    redirect_to(root_path, notice: t(:'auto_auth.registration.confirmed'))
  end

  def create
    @registration = Registration.new(registration_params)
    if employee = @registration.save!
      sign_in!(employee)
      employee.credential.send_confirmation_email
      redirect_to(root_path, notice: t(:'auto_auth.registrations.account_created'))
    else
      render :new
    end
  end


  private

  def setup_credential
    Credential.verify_signature!(Credential::EMAIL_CONFIRMATION_KEY, params.require(:email_confirmation_token)) do |record, expires_at|
      if expires_at < Time.current
        redirect_to(root_path, alert: t(:'auto_auth.registrations.expired'))
      else
        @credential = record
      end
    end
  end

  def registration_params
    params.require(:registration).permit(:name, :email, :password, :password_confirmation)
  end

end
