FactoryGirl.define do

  factory :folder do

    title "Folder 1"
    description { Faker::Lorem.sentence }
    number { Faker::Number.number(10) }
    active { Faker::Boolean.boolean }
    enterprise_id { create(:enterprise).id }
    feature_id { create(:feature).id }
    phase_id { create(:phase).id }

  end
  
end