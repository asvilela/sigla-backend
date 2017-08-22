FactoryGirl.define do

  factory :priority do

    title "Priority 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end