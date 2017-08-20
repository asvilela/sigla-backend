FactoryGirl.define do

  factory :enterprise do

    title { Faker::Company.catch_phrase }
    description { Faker::Company.catch_phrase }
    active { Faker::Boolean.boolean }
    enterprise_type_id { create(:enterprise_type).id }

  end
  
end