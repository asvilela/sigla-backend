FactoryGirl.define do

  factory :document do

    title "Document 1"
    description { Faker::Lorem.sentence }
    file_path { Faker::Avatar.image }
    issue_date { Faker::Date.backward(14) }
    due_date { Faker::Date.forward(23) }
    folder_id { create(:folder).id }
    content_type_id { create(:content_type).id }

  end
  
end