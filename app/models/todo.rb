class Todo
  include Mongoid::Document
  include Mongoid::Timestamps
  include TodoStateMachine

  field :task_name, type: String
  field :status, type: String, default: "not_assigned"

  belongs_to :developer, class_name: 'User', optional: true
  belongs_to :project

  validates :task_name, :status, presence: true
  validate :status_developer_id_match?

  def status_developer_id_match?
    if(self.status == "not_assigned" && self.developer_id.present?)
      self.errors[:status] << "should be as assigned or developer section should be empty"
    elsif(self.status != "not_assigned" && self.developer_id == nil)
      self.errors[:developer_id] << "should be present or status should be as not assigned"
    end
  end
  
  def self.available_statuses
    ["not_assigned", "assigned", "in_progress", "done"]
  end
end
