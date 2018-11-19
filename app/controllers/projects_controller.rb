class ProjectsController < ApplicationController
  before_action :set_project ,except: [:index, :new, :create]
  before_action :authorize_resource
  before_action :set_developers 

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new
    @project.assign_attributes(project_params)
    respond_to do |format|
      if(@project.save)
        flash[:notice] = "project was successfully created. "
        format.html { redirect_to dashboard_index_path }
      else
        format.html { render :new }    
      end
    end
  end

  def update
    respond_to do |format|
      if(@project.update_attributes(project_params))
        flash[:notice] = "project was successfully updated."
        format.html { redirect_to dashboard_index_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_developers
    @developers = User.where(role: "Developer")
  end

  def project_params
    params.require(:project).permit(:name, :creator_id, :developer_ids => [])
  end

  def authorize_resource
    if params[:action] == "index"
    elsif params[:action] == "new" || params[:action] == "create"
      authorize Project.new
    else
      authorize @project
    end
  end

end
