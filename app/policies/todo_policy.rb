class TodoPolicy < ApplicationPolicy

  def index?
    ["Manager", "Developer"].include?(@user.role)
  end

  def new?
    @user.role == "Manager"
  end

  def create?
    @user.role == "Manager"
  end

  def update?
    ["Manager","Developer"].include?(@user.role)
  end

  def destroy?
    @user.role == "Manager"
  end

  def permitted_attributes params={}
    attributes = (@record.status_changed? && @record.persisted?) ? [] : [:status]
    attributes += ["Manager"].include?(@user.role) ? [:task_name, :developer_id] : []
    attributes
  end

end
