class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery except: :sign_in
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :document])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :document])
  end
end
