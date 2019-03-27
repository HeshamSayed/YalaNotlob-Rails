class ApplicationController < ActionController::Base
<<<<<<< HEAD
  # before_action :authenticate_user!
  protect_from_forgery # Same as above
=======
  before_action :authenticate_user!
>>>>>>> 523ff88ba60d3c213b559dc545beee79357d8bd5
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me ,:image) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password , :remember_me) }
  end
end