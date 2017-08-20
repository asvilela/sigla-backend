class Document < ApplicationRecord
  belongs_to :folder
  belongs_to :content_type

  validates_presence_of :title, :description, :file_path, :issue_date, :folder, :content_type
end
