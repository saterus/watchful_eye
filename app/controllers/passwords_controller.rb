class PasswordsController < ApplicationController

  respond_to :html

  skip_before_action :authenticate!
  before_action :setup_credential, only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    email = params[:credential][:email]
    if credential = Credential.find_by(email: email)
      CredentialMailer.reset_password(credential).deliver
    end
    redirect_to(root_path, notice: t(:'auth_auth.passwords.reset_instructions'))
  end

  def update
    if @credential.update!(password_params)
      redirect_to(root_path, notice: t(:'auto_auth.passwords.reset'))
    else
      render :edit
    end
  end


  private

  def setup_credential
    Credential.verify_signature!(TokenVerification::PASSWORD_RESET, params.require(:password_reset_token)) do |record, expires_at|
      if expires_at < Time.current
        redirect_to(root_path, alert: t(:"auto_auth.passwords.expired")) and return
      else
        @credential = record
      end
    end
  end

  def password_params
    params.require(:credential).permit(:password, :password_confirmation)
  end

end
