class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_quantity_ordered, default:1
      t.references :order, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
