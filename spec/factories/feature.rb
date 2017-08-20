FactoryGirl.define do

  factory :feature do

    title "Feature 1"
    description { Faker::Lorem.sentence }
    active { Faker::Boolean.boolean }

  end
  
end