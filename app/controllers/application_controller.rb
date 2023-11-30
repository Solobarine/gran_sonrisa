class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  before_action :set_mailer_host

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :current_password)
    end
  end

  private

  def set_mailer_host
    host = request.host_with_port
    Rails.application.config.action_mailer.default_url_options = { host: }
  end
end
