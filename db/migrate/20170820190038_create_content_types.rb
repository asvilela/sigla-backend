class CreateContentTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :content_types do |t|
      t.string :title
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
