FactoryGirl.define do

  factory :task_status do

    title "Task Status 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end