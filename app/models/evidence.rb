class Evidence < ApplicationRecord
  belongs_to :task
  belongs_to :evidence_type

  validates_presence_of :title, :task, :evidence_type
end
