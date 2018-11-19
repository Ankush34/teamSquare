require 'rails_helper'

RSpec.describe User, type: :model do

  describe "presence validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:role) }
  end
  
  describe "uniqueness validations" do
    it { is_expected.to validate_uniqueness_of(:email) }
  end
  
  describe "association validations" do
    it { is_expected.to have_and_belong_to_many(:projects) }
    it { is_expected.to have_many(:todos) }
  end

end
