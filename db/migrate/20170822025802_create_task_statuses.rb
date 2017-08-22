class CreateTaskStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :task_statuses do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
