class Company < ApplicationRecord
  belongs_to :company_type
  has_one :address

  validates_presence_of :cnpj, :company_name, :trade_name, :company_type
end
