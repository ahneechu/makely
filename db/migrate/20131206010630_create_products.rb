class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.string :product_image
      t.decimal :product_price
      t.integer :product_quantity
      t.integer :product_avail_inventory
      t.decimal :product_total_cost
      t.references :cateogry, index: true
      t.references :store, index: true

      t.timestamps
    end
  end
end
