class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.date :ordered_date
      t.date :pending_date
      t.date :completed_date
      t.date :cancel_date
      t.boolean :achived_state
      t.boolean :product_purchased
      t.references :customer, index: true
      t.references :store, index: true

      t.timestamps
    end
  end
end
