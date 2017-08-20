class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
