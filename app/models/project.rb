class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include ArrayBlankRejectable
  
  field :name, type: String
  field :creator_id, type: BSON::ObjectId

  has_and_belongs_to_many :developers, class_name: 'User'
  has_many :todos

  validates :name, :creator_id, presence: true
  
  def manager
    User.find(self.creator_id)
  end

  def get_todo_details_for_map
    data = {}
    self.todos.each do |todo|
      data[todo.status.humanize] = data[todo.status.humanize].nil? ? 1 : (data[todo.status.humanize] + 1)
    end
    data
  end
end
