class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def total_price
  	product.product_price * product_quantity_ordered

  end

end

