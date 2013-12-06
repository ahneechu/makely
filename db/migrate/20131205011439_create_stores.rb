class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :store_description
      t.string :store_image
      t.references :cause, index: true

      t.timestamps
    end
  end
end
