class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :document])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :document])
  end
end
