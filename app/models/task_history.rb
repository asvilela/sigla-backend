class TaskHistory < ApplicationRecord
  belongs_to :task
  belongs_to :task_status
  belongs_to :user

  validates_presence_of :task, :task_status, :user
end
