class Folder < ApplicationRecord
  belongs_to :enterprise
  belongs_to :feature
  belongs_to :phase

  validates_presence_of :title, :description, :enterprise, :feature, :phase
end
