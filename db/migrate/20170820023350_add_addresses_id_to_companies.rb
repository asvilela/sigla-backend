class AddAddressesIdToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_reference :companies, :address, foreign_key: true
  end
end
