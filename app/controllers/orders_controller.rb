class OrdersController < ApplicationController

before_action :set_order, only: [:show, :edit, :update, :destroy]

	def new
		# @customer_id = params[:customer_id]
		@customer = Customer.find(params[:customer_id])
		# @order = Order.new
		@order = Order.new
	end


	def index
		@customer = Customer.find(params[:customer_id])
		# @orders = Order.all
		@orders = current_customer_user.orders
	end


	def show
		@order = Order.find(params[:id])
	end


	def create
		@customer = Customer.find(params[:customer_id])
		@order = Order.new(params.require(:order).permit(order_params))
				# @order = Order.new(params.require(:order).permit(:order_number, :ordered_date, :pending_date, :completed_date, :cancel_date, :archived_state, :product_purchased, :customer_id, :store_id))

		if @order.save
			redirect_to customer_orders_url
			# redirect_to customers_url
		end

	end

		def edit
	     	@order = Order.find(params[:id])
	  	end

	  	def update
	  		@order.update(order_params)
	  		redirect_to orders_url
	  	end

	  	 def destroy
	  	 	Order.find(params[:id]).destroy
    		# @order.destroy
    		redirect_to orders_url
  		end


private
    # Use callbacks to share common setup or constraints between actions.

    def set_order
      @order = Order.find(params[:id])
          # respond_with (@orders)


    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_number, :ordered_date, :pending_date, :completed_date, :cancel_date, :archived_state, :product_purchased, :customer_id, :store_id)

    end



end