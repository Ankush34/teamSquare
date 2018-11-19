class TodosController < ApplicationController
  before_action :set_todo, except: [:index, :new, :create]
  before_action :set_project
  def new
    @todo = Todo.new
  end

  def edit
    render :edit
  end

  def create
    @todo = Todo.new
    @todo.assign_attributes(todo_params)
    @project.todos << @todo
    if(@todo.save)
      redirect_to dashboard_index_path
    else
      respond_to do |format|
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if(@todo.update_attributes(todo_params))
        flash[:notice] = "todo was added successfully."
        format.html { redirect_to dashboard_index_path }
      else
        flash[:notice] = "todo could not be added."
        format.html { render :edit }   
      end
    end
    binding.pry
  end
  
  def destroy
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

end
