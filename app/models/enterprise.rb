class Enterprise < ApplicationRecord
  belongs_to :enterprise_type
  # belongs_to :address
  belongs_to :company

  validates_presence_of :title, :description, :enterprise_type, :company
end
