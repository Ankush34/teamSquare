class ProjectsController < ApplicationController
  before_action :set_project ,except: [:index, :new]
  def index
  end

  def new
  end

  def edit
    @developers = User.where(role: "Developer")
  end

  def create
  end

  def update
    respond_to do |format|
      if(@project.update_attributes(project_params))
        flash[:notice] = "project was successfully updated."
        format.html { redirect_to dashboard_index_path }
      else
        flash[:error] = "Couldn't update project."
        format.html { render :edit }
      end
    end
    binding.pry
  end

  def destroy
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :developer_ids => [])
  end
end
