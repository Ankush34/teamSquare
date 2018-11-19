class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :task_name, type: String
  field :status, type: String, default: "Not-Assigned"

  belongs_to :developer, class_name: 'User', optional: true
  belongs_to :project

  def self.available_statuses
    ["Not-Assigned", "Assigned", "-In-Progress", "Done"]
  end
end
