class CreateRecurrenceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :recurrence_types do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
