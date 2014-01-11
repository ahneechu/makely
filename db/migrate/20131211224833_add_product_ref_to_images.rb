class AddProductRefToImages < ActiveRecord::Migration
  def change
    # add_reference :images, index: true
    add_reference :images, :product, index: true
  end
end
