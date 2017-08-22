class ConditionalHistory < ApplicationRecord
  belongs_to :conditional
  belongs_to :conditional_status
  belongs_to :user
end
