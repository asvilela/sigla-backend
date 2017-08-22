class CreateConditionalHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :conditional_histories do |t|
      t.references :conditional, foreign_key: true
      t.references :conditional_status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
