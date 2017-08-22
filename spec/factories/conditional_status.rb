FactoryGirl.define do

  factory :conditional_status do

    title "Conditional Status 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end