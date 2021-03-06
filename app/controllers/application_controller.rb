class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Authentication

  before_action :authenticate!

  rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :handle_invalid_signature


  private

  def handle_invalid_signature
    redirect_to(root_path, alert: t(:'auto_auth.application.invalid_signature'))
  end

end
