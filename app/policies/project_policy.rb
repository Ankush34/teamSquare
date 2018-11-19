class ProjectPolicy < ApplicationPolicy

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
    attributes = []
    attributes += ["Manager"].include?(@user.role) ? [:name, :developer_ids] : []
    attributes
  end

end
