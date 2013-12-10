module CurrentOrder
	extend ActiveSupport::Concern

	private

	def set_order
	  @order = Order.find(session[:order_id])
	rescue ActiveRecord::RecordNotFound
	  # puts "making current order"
	  @order = Order.create
	  puts @order.inspect
	  session[:order_id] = @order.id
	 end

end

