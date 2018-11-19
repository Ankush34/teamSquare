FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    role { User.available_roles.sample }
    
    before(:create) do |user|
      user.skip_confirmation!
      user.reset_password("123456", "123456")
      user.save!
    end
  end
end