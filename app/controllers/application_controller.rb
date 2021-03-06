class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
 

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:name, :email, :password, :password_confirmation, :gender)
  end
end
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update) do |user_params|
    user_params.permit(:name, :email, :password, :password_confirmation, :current_password, :gender)
  end
end
end
