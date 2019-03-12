class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email username password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar avatar_cache remove_avatar email username password password_confirmation])
  end
end
