class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def validate_admin
    if !(current_user.present? || current_user.admin?)
      redirect_to root_path, notice: "You must be an admin to access this page."
    end
  end

  def validate_edit(story_id)
    return false if !current_user.present?
    user_valid = (Story.find(story_id).user_id == current_user.id) ? true : false
    return current_user.admin? || user_valid ? true : false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate_admin
    unless current_user.present? || current_user.admin?
      redirect_to root_path, alert: "You must be an admin to access this page."
    end
  end
  

end
