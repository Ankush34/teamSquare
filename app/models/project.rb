class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include ArrayBlankRejectable
  
  field :name, type: String
  field :creator_id, type: BSON::ObjectId

  has_and_belongs_to_many :developers, class_name: 'User'
  has_many :todos

  def manager
    User.find(self.creator_id)
  end
end
