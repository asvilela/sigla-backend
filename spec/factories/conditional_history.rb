FactoryGirl.define do

  factory :conditional_history do

    conditional_id { create(:conditional).id }
    conditional_status_id { create(:conditional_status).id }
    user_id { create(:user).id }

  end
  
end