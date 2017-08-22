FactoryGirl.define do

  factory :recurrence_type do

    title "Recurrence Type 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end