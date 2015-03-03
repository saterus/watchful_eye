class CredentialMailer < ActionMailer::Base

  def reset_password(credential)
    @credential = credential
    @reset_password_url = edit_password_url(credential, password_reset_token: @credential.password_reset_token)
    mail(to: credential.email, subject: t(:'auto_auth.mailers.reset_password.subject'))
  end

  def confirm_email(credential)
    @credential = credential
    @confirm_email_url = confirm_registrations_url(email_confirmation_token: @credential.email_confirmation_token)
    mail(to: credential.email, subject: t(:'auto_auth.mailers.confirm_email.subject'))
  end

end
