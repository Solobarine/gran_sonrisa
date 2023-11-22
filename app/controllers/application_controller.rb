class ApplicationController < ActionController::Base
  protect_from_forgery with.exception
  before_action :update_allowed_parameters, if: :devise_controller?

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :current_password)
    end
  end
end
