class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :seller_username
      t.string :email
      t.string :salt
      t.string :hashed_password

      t.timestamps
    end
  end
end
