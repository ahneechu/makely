class SellersController < ApplicationController
	def new
		@seller = Seller.new
	end

	def show
	end

	def create
		@seller = Seller.new(params.require(:seller).permit(:seller_username, :email, :password, :password_confirmation))
		
		if @seller.save
			redirect_to new_store_path
		end

		# seller = Seller.find_by(seller_username: params[:seller][:seller_username])
	 # 	if seller.authenticate(params[:seller][:password])
  #       session[:seller_id] = seller.id
  #       redirect_to new_stores_path
  #   	end

	end
end
