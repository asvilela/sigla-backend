FactoryGirl.define do

  factory :conditional do

    title "Conditional 1"
    description { Faker::Lorem.sentence }
    due_date { Faker::Date.forward(23) }
    document_id { create(:document).id }
    conditional_status_id { create(:conditional_status).id }
    conditional_type_id { create(:conditional_type).id }
    recurrence_type_id { create(:recurrence_type).id }

  end
  
end