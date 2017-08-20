class CreateCompanyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :company_types do |t|
      t.string :title
      t.string :description
      t.boolean :active
      t.boolean :licensor

      t.timestamps
    end
  end
end
