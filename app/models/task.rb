class Task < ApplicationRecord
  belongs_to :conditional
  belongs_to :priority
  belongs_to :task_status

  validates_presence_of :title, :description, :start_date, :conditional, :priority, :task_status
end
