class ApplicationController < ActionController::Base
  before_action :check_profile_set
  before_action :configure_permitted_parameters, if: :devise_controller?


  def check_profile_set
    if current_user
      @is_profile_set = current_user.is_profile_set?
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
