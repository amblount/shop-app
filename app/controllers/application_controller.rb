class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include OrderItemsHelper
  helper_method :current_order

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:first_name, :last_name, :email, :password, :password_confirmation, :full_address, :address, :city, :state, :zipcode, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :full_address, :address, :city, :state, :zipcode, :country])
  end
end
