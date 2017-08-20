FactoryGirl.define do

  factory :address do

    zipCode { Faker::Address.zip_code }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    gia ""
    ibge ""

  end
  
end