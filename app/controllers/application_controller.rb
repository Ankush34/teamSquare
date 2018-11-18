class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(current_user)
  	dashboard_index_path
  end
end
