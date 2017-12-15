class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :is_female, :date_of_birth, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password, :is_female, :date_of_birth, :avatar])
  end

def authorize_admin
    if current_user.admin === true
      new_skill_path
    else
      flash[:alert] = "Only an admin can visit this page."
      redirect_to '/'
    end
  end
end
