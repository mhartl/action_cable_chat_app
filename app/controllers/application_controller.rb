class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include SessionsHelper

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
