class ApplicationController < ActionController::Base
  def index
    redirect_to new_user_registration_path
  end
end
