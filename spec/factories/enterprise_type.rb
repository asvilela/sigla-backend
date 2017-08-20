FactoryGirl.define do

  factory :enterprise_type do

    title "Enterprise Type 1"
    description ""
    active { Faker::Boolean.boolean }

  end
  
end