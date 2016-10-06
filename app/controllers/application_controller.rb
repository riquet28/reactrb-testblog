class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def layout_by_resource
    if devise_controller?
      "devise_template"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :firstname, :lastname, :function ])
  end

end
