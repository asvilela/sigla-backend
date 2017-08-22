class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :start_date
      t.date :due_date
      t.references :conditional, foreign_key: true
      t.references :priority, foreign_key: true
      t.references :task_status, foreign_key: true

      t.timestamps
    end
  end
end
