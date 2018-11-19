require 'rails_helper'

RSpec.describe Todo, type: :model do 

  describe "presence validations" do
    it {is_expected.to validate_presence_of(:task_name)}
    it {is_expected.to validate_presence_of(:status)}
  end

  describe "association validations" do
    it {is_expected.to belong_to(:developer).of_type(User) }
    it {is_expected.to belong_to(:project)}   
  end

  describe "custom validations" do
    it "is expected to validate status and developer id field on the model" do
      todo = FactoryBot.build(:todo)
      if(todo.status == "not_assigned" && todo.developer_id.present?)
        todo.valid?
        expect(todo).to be_invalid
      elsif(todo.status != "not_assigned" && todo.developer_id == nil)
        todo.valid?
        expect(todo).to be_invalid
      else
        todo.valid?
        expect(todo).to be_valid
      end
    end
  end
end