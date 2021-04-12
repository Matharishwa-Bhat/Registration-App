class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone_number,:address_line,:landmark,:street,:city,:state,:pin_code, :user_type, :picture, :avatar])
  end

end
