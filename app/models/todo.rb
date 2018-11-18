class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :task_name, type: String
  field :status, type: String

  belongs_to :user, optional: true
  belongs_to :project
end
