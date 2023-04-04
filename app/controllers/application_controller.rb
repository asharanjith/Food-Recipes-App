class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :public_page?
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  def public_page?
    controller_name == 'public_recipes' && action_name == 'index'
  end
  
end
