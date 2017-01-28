class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end

  def after_sign_out_path_for(resorce)
    new_user_session_path
  end

  def after_sign_in_path_for(resorce)
    session[:previous_url] || chat_groups_path
  end
end
