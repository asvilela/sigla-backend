class ConditionalHistory < ApplicationRecord
  belongs_to :conditional
  belongs_to :conditional_status
  belongs_to :user

  validates_presence_of :conditional, :conditional_status, :user
end
