class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.boolean :active
      t.string :cnpj
      t.string :company_name
      t.string :trade_name

      t.timestamps
    end
  end
end
