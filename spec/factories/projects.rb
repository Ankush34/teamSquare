FactoryBot.define do
  factory :project do
    name { Faker::Lorem.word }
    creator_id {FactoryBot.create(:user)._id} 
  end
end