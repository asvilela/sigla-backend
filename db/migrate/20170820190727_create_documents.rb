class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :file_path
      t.date :issue_date
      t.date :due_date
      t.references :folder, foreign_key: true
      t.references :content_type, foreign_key: true

      t.timestamps
    end
  end
end
