FactoryGirl.define do

  factory :enterprise do

    title { Faker::Company.catch_phrase }
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }
    enterprise_type_id { create(:enterprise_type).id }
    company_id { create(:company).id }

  end
  
end