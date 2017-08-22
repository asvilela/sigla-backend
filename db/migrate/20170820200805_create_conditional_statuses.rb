class CreateConditionalStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :conditional_statuses do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
