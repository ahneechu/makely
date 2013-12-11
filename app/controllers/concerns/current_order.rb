module CurrentOrder
	extend ActiveSupport::Concern

	private


	# log-in
	# current_order = current_customer.orders.last
	# current_customer.orders


	def set_order
	#   @order = Order.find(session[:order_id])
	# rescue ActiveRecord::RecordNotFound
	  # puts "making current order"
	  # @order = Order.create
	  @order = current_customer_user.current_order
	  # puts @order.inspect
	  # session[:order_id] = @order.id
	 end

end

