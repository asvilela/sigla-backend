FactoryGirl.define do

  factory :enterprise_type do

    title "Enterprise Type 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end