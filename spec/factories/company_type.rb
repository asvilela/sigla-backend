FactoryGirl.define do

  factory :company_type do

    title "Company Type 1"
    description ""
    active { Faker::Boolean.boolean }
    licensor { Faker::Boolean.boolean }

  end
  
end