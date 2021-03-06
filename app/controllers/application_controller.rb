class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_order, :resource_name, :resource, :devise_mapping

  def current_order
    if session[:order_id]
      Order.new
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def is_admin?
    current_user.admin if current_user
  end

  def administrative
    if not is_admin?
     redirect_to root_url
   end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
