class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :store
  has_many :line_items, dependent: :destroy

      # validates :order_number, numericality: {greater_than: 0}

      def add_product(product_id)
      	current_item = line_items.find_by(product_id: product_id)
      	if current_item && current_item.product_quantity_ordered
      		current_item.product_quantity_ordered += 1
      	else

      	current_item = self.line_items.build(product_id: product_id, product_quantity_ordered: 1)
      		# current_item.line_items.build(product_id: product_id)
      		# self.line_items.build(product_id: product_id, product_quantity_ordered: 1)
      		# current.line_items.build(product_id: product_id, product_quantity_ordered: 1)
      		# this is what was replaced -- @line_item = @order.line_items.build(product: product)
      		# @line_item = @order.line_items.build(product: product)
      	end
      	current_item
      end


      def total_price
      	line_items.to_a.sum {|item| item.total_price }
      end


end
