FactoryGirl.define do

  factory :company do

    active { Faker::Boolean.boolean }
    cnpj "80.451.604/0001-93"
    company_name { Faker::Company.name }
    trade_name { Faker::Company.name }

  end
  
end