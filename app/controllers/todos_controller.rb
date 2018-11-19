class TodosController < ApplicationController
  before_action :set_todo, except: [:index, :new, :create]
  before_action :set_project
  before_action :authorize_resource

  def new
    @todo = Todo.new
  end

  def edit
    render :edit
  end

  def create
    @todo = Todo.new
    @todo.send(STATES_MAP_DATA_CONF[todo_params[:status]]) if(todo_params[:status].present?)
    respond_to do |format| 
      if(@todo.errors.empty? && @todo.assign_attributes(permitted_attributes(@todo)) && @project.todos << @todo && @todo.save) 
        flash[:notice] = "todo was successfully created."
        format.html {redirect_to dashboard_index_path}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      @todo.send(STATES_MAP_DATA_CONF[todo_params[:status]]) if(todo_params[:status].present?)
      if( @todo.errors.empty? && @todo.update_attributes(permitted_attributes(@todo)))
        flash[:notice] = "todo was successfully updated. "
        format.html { redirect_to dashboard_index_path }
      else
        format.html { render :edit }   
      end
    end
  end
  
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'Todo was successfully destroyed.' }
    end
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def set_project
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:task_name, :status, :developer_id)
  end
  
  def authorize_resource
    if params[:action] == "index"
    elsif params[:action] == "new" || params[:action] == "create"
      authorize Todo.new
    else
      authorize @todo
    end
  end

end
