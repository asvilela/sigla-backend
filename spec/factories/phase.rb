FactoryGirl.define do

  factory :phase do

    title "Phase 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end