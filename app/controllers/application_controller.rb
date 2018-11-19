class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
	before_action :authenticate_user!
  skip_before_action :verify_authenticity_token  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def after_sign_in_path_for(current_user)
  	dashboard_index_path
  end

  def user_not_authorized
    flash[:notice] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
