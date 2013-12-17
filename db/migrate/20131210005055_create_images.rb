class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product, index: true
      t.string :direct_upload_url
      t.attachment :upload
      t.boolean :processed, default: false, null: false, index: true

      t.timestamps
    end
  end
end
