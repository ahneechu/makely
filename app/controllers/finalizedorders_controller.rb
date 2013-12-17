class FinalizedordersController < ApplicationController

include CurrentOrder

before_action :set_order, only: [:new, :create]
before_action :set_finalizedorder, only: [:show, :edit, :update, :destroy]

	def new
		if @order.line_items.empty?
		redirect_to store_products_url, notice: "Your cart is empty"
		end

		@finalizedorder = Finalizedorder.new
	end


	def index
		@finalizedorders = Finalizedorder.all
		@customer = current_customer_user
	end


	def show
		@finalizedorder = Finalizedorder.find(params[:id])
	end

	def create
		@finalizedorder = Finalizedorder.new(params.require(:finalizedorder).permit(:customer_username, :customer_email, :customer_name, :customer_address, :customer_city, :customer_state, :customer_zipcode, :customer_phone, :pay_type, :CC_number, :CC_name, :security_code, :CC_expiration_date, :customer_shipping_address, :customer_shipping_city, :customer_shipping_state, :customer_shipping_zipcode))
		
		if @finalizedorder.save
			redirect_to finalizedorders_url
		end

	end

		def edit
	     	@finalizedorder = Finalizedorder.find(params[:id])
	  	end

	  	def update
	  		@finalizedorder.update(finalizedorder_params)
	  		redirect_to customers_url
	  	end

	  	 def destroy
	  	 	Finalizedorder.find(params[:id]).destroy
    		redirect_to finalizedorders_url
  		end




end