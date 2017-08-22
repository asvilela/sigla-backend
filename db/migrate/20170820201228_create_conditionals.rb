class CreateConditionals < ActiveRecord::Migration[5.0]
  def change
    create_table :conditionals do |t|
      t.string :title
      t.string :description
      t.string :due_date
      t.references :document, foreign_key: true
      t.references :conditional_status, foreign_key: true
      t.references :conditional_type, foreign_key: true
      t.references :recurrence_type, foreign_key: true

      t.timestamps
    end
  end
end
