class Enterprise < ApplicationRecord
  belongs_to :enterprise_type
  has_one :address

  validates_presence_of :title, :description, :enterprise_type
end
