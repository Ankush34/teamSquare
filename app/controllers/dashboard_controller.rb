class DashboardController < ApplicationController
	def index
    @todos = current_user.todos
    if(current_user.role?("Manager"))
      @projects = Project.where(creator_id: current_user.id)
    else
      @projects = current_user.projects
    end
   	render :index
	end
end
