class AddCompanyIdToEnterprise < ActiveRecord::Migration[5.0]
  def change
    add_reference :enterprises, :company, foreign_key: true
  end
end
