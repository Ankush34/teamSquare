class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token  
  
  def after_sign_in_path_for(current_user)
  	dashboard_index_path
  end
end
