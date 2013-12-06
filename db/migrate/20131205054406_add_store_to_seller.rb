class AddStoreToSeller < ActiveRecord::Migration
  def change
    add_reference :sellers, :store, index: true
  end
end
