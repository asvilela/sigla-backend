FactoryGirl.define do

  factory :evidence_type do

    title "Evidence Type 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end