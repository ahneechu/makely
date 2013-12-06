class SellersController < ApplicationController
	def new
		@seller = Seller.new
	end

	def show
		@seller = Seller.find(params[:id])
	end

	def create
		@seller = Seller.new(seller_params)
		
		if @seller.save
			flash[:notice] = "Seller created!"
			redirect_to @seller
			# else
		# 	flash[:notice] = "Error.  Please resubmit"
		# 	redirect_to new_seller_path
    	end

		# seller = Seller.find_by(seller_username: params[:seller][:seller_username])
	 # 	if seller.authenticate(params[:seller][:password])
	 #        session[:seller_id] = seller.id
	 #        flash[:notice] = "Seller created!"
	 #        redirect_to @seller
	end


private

	def seller_params
      	params.require(:seller).permit(:seller_username, :email, :password, :password_confirmation)
    end
end
