FactoryBot.define do
  factory :todo do
    task_name { Faker::Lorem.sentence }
    status { Todo.available_statuses.sample.humanize }

    association :developer, factory: :user
    association :project, factory: :project
  end
end