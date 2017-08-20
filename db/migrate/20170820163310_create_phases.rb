class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
