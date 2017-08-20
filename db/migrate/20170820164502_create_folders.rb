class CreateFolders < ActiveRecord::Migration[5.0]
  def change
    create_table :folders do |t|
      t.string :title
      t.string :description
      t.string :number
      t.boolean :active
      t.references :enterprise, foreign_key: true
      t.references :feature, foreign_key: true
      t.references :phase, foreign_key: true

      t.timestamps
    end
  end
end
