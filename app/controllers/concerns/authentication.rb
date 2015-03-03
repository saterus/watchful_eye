require 'active_support/concern'

module Authentication

  extend ActiveSupport::Concern

  included do
    helper_method :current_employee, :signed_in?, :redirect_to_or_default
  end

  def sign_in!(employee)
    session[:employee_id] = employee.id
  end

  def current_employee
    if session[:employee_id].present?
      @current_employee ||= Employee.find(session[:employee_id])
    end
  rescue ActiveRecord::RecordNotFound => e
    reset_session
  end

  def signed_in?
    !!current_employee
  end

  def authenticate!
    unless signed_in?
      store_target_location
      redirect_to(sign_in_url, alert: t(:"auto_auth.sessions.required"))
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

  def redirect_authenticated
    if signed_in?
      redirect_to_target_or_default(root_path, notice: t(:"auto_auth.sessions.existing"))
    end
  end


  private

  def store_target_location
    session[:return_to] = request.url
  end

end
