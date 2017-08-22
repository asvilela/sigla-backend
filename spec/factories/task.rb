FactoryGirl.define do

  factory :task do

    title "Task 1"
    description { Faker::Lorem.sentence }
    start_date { Faker::Date.backward(14) }
    due_date { Faker::Date.forward(23) }
    conditional_id { create(:conditional).id }
    priority_id { create(:priority).id }
    task_status_id { create(:task_status).id }

  end
  
end