class CreateFinalizedorders < ActiveRecord::Migration
  def change
    create_table :finalizedorders do |t|
      t.string :customer_username
      t.string :customer_email
      t.string :customer_name
      t.string :customer_address
      t.string :customer_city
      t.string :customer_state
      t.integer :customer_zipcode
      t.string :customer_phone
      t.string :pay_type
      t.string :CC_number
      t.string :CC_name
      t.string :security
      t.string :code
      t.string :CC_expiration_date
      t.string :customer_shipping_address
      t.string :customer_shipping_city
      t.string :customer_shipping_state
      t.integer :customer_shipping_zipcode

      t.timestamps
    end
  end
end
