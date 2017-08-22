class CreateEvidences < ActiveRecord::Migration[5.0]
  def change
    create_table :evidences do |t|
      t.string :title
      t.string :description
      t.date :file_date
      t.string :file_path
      t.string :number
      t.references :task, foreign_key: true
      t.references :evidence_type, foreign_key: true

      t.timestamps
    end
  end
end
