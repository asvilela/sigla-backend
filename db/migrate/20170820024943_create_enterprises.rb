class CreateEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprises do |t|
      t.string :title
      t.string :description
      t.boolean :active
      t.references :enterprise_type, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
