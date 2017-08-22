class Evidence < ApplicationRecord
  belongs_to :task
  belongs_to :evidence_type
end
