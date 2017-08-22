FactoryGirl.define do

  factory :conditional_type do

    title "Conditional Type 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end