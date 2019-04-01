class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery # Same as above
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
     home_index_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me ,:image) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password , :remember_me) }
  end
end