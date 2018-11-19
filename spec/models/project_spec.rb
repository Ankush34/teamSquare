require 'rails_helper'

RSpec.describe Project, type: :model do
  
  describe "presence validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:creator_id) }
  end

  describe "association validation" do
    it { is_expected.to have_and_belong_to_many(:developers).of_type(User) }
    it { is_expected.to have_many(:todos) } 
  end
end
