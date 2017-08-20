FactoryGirl.define do

  factory :content_type do

    title "Content Type 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end