class Company < ApplicationRecord
  belongs_to :address
  has_many :entreprise

  validates_presence_of :cnpj, :company_name, :trade_name
end
