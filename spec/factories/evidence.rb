FactoryGirl.define do

  factory :evidence do

    title "Evidence 1"
    description { Faker::Lorem.sentence }
    number { Faker::Number.number(10) }
    file_path { Faker::Avatar.image }
    file_date { Faker::Date.backward(14) }
    task_id { create(:task).id }
    evidence_type_id { create(:evidence_type).id }

  end
  
end