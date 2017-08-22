FactoryGirl.define do

  factory :task_history do

    task_id { create(:task).id }
    task_status_id { create(:task_status).id }
    user_id { create(:user).id }

  end
  
end