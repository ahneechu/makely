class CustomersController < ApplicationController
	def new
		@customer = Customer.new
	end

	def show
	end

	def create
		@customer = Customer.new(params.require(:customer).permit(:customer_username, :customer_email, :customer_hashed_password, :password_confirmation))
		
		if @customer.save
			redirect_to customers_url
		end

		# seller = Seller.find_by(seller_username: params[:seller][:seller_username])
	 # 	if seller.authenticate(params[:seller][:password])
  #       session[:seller_id] = seller.id
  #       redirect_to new_stores_path
  #   	end

	end
end

