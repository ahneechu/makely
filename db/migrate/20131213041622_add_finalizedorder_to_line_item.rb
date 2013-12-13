class AddFinalizedorderToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :finalizedorder, index: true
  end
end
