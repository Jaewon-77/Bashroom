class ApplicationController < ActionController::Base
  before_action :check_profile_set

  def check_profile_set
    if current_user
      @is_profile_set = current_user.is_profile_set?
    end
  end
end
