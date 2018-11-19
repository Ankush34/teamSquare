class Todo
  include Mongoid::Document
  include Mongoid::Timestamps
  include TodoStateMachine

  field :task_name, type: String
  field :status, type: String, default: "not_assigned"

  belongs_to :developer, class_name: 'User', optional: true
  belongs_to :project

  def self.available_statuses
    ["not_assigned", "assigned", "in_progress", "done"]
  end
end
