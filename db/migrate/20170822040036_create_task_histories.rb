class CreateTaskHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :task_histories do |t|
      t.references :task, foreign_key: true
      t.references :task_status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
