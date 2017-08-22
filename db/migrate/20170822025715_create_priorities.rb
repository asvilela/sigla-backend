class CreatePriorities < ActiveRecord::Migration[5.0]
  def change
    create_table :priorities do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
