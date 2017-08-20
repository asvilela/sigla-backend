class Address < ApplicationRecord
  has_one :company
  has_one :enterprise

  validates_presence_of :zipCode, :street, :number, :neighborhood, :city, :state, :country

end


