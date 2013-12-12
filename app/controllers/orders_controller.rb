class OrdersController < ApplicationController

include CurrentOrder

before_action :set_order, only: [:show, :edit, :update, :destroy]

rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

	def new
		# @customer_id = params[:customer_id]
		# @customer = Customer.find(params[:customer_id])
		customer = Customer.find(params[:customer_id])
		# @order = Order.new
		@order = customer.orders.build

		# @order = Order.new
	end


	def index
		customer = Customer.find(params[:customer_id])
		# @customer = Customer.find(params[:customer_id])
		# @orders = Order.all
		# @orders = customer.order.all
		# @orders = @customer.orders
		@orders = customer.orders
		# @orders = current_customer_user.orders
		# @orders = Customer.find_by(customer_id: params[:customer_id])
		# @orders = @customer.orders
	end


	def show
		# @customer = Customer.find(params[:customer_id])
	end 


	def create
		# @customer = Customer.find(params[:customer_id])
		customer = Customer.find(params[:customer_id])
		@order = customer.orders.new(order_params)
		# @order = customer.orders.create(order_params)

		# @order = Order.new(params.require(:order).permit(order_params))
		# @order = Order.new(params[:order].permit(:order_number, :ordered_date, :pending_date, :completed_date, :cancel_date, :archived_state, :product_purchased, :customer_id, :store_id))
				# @order = Order.new(params.require(:order).permit(:order_number, :ordered_date, :pending_date, :completed_date, :cancel_date, :archived_state, :product_purchased, :customer_id, :store_id))

		if @order.save
			redirect_to([@order.customer, @order])
			# redirect_to customer_order_url(@customer)
			# redirect_to customer_order_url(@customer, @order)
			# redirect_to "/customers/5/orders"
			# redirect_to customer_order_url
			# redirect_to customers_url
		else
			render new
		end

	end

	def edit
     	@order = Order.find(params[:id])
  	end

  	def update
  		if @order.update_attributes(order_params)
  		# @order.update(order_params)
  		redirect_to customer_orders_url
  		end
  	end

  	def destroy
  	 	@order.destroy
  	 	# Order.find(params[:id]).destroy
		# @order.destroy
		respond_to do |format|
		format.html { redirect_to customer_order_url, notice: 'Your cart is currently empty'}
		# format.html { redirect_to store_products_url, notice: 'Your cart is currently empty'}
		format.json { head :no_content}
		end
	end

	def invalid_order
		logger.error "Attempt to access invalid order #{params[:id]}"
		redirect_to customer_orders_url, notice: 'Invalid order'
	end

private
    # Use callbacks to share common setup or constraints between actions.

    def set_order
    	customer = Customer.find(params[:customer_id])
    	@order = customer.orders.find(params[:id])

    	#*TEST- Currently using Fictious customer 5 as a test
    	# @order = Order.find(params[:id])


      # @order = Order.find(params[:id])
      #     respond_with (@orders)


    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_number, :ordered_date, :pending_date, :completed_date, :cancel_date, :archived_state, :product_purchased, :customer_id, :store_id)

    end



end