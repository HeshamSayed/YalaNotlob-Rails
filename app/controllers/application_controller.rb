class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me ,:image) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password , :remember_me) }
  end
end