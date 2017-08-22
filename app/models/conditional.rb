class Conditional < ApplicationRecord
  belongs_to :document
  belongs_to :conditional_status
  belongs_to :conditional_type
  belongs_to :recurrence_type

  validates_presence_of :title, :description, :due_date, :document, :conditional_status, :conditional_type, :recurrence_type
end
