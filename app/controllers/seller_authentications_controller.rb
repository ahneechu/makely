class SellerAuthenticationsController < ApplicationController
	#only call into
	before_action :authenticate_user, only: [:destroy]


	def new
		# are they already logged in?
		if current_user #they are!  can't create them again
			redirect_to sellers_url
		else
			@seller = Seller.new
			render :new
		end
	end	


	def show
	end


	def create
		puts "We're in the create!"
		seller = Seller.find_by(email: params[:seller][:email])
		# if user
		if seller != nil
			#authenticate seller and then redirect them to user profile page
			if seller.authenticate(params[:seller][:password])
				session[:user_id] = seller.id
				redirect_to products_sellers_index_path(current_user.store_id)
			end
		else
			# flash.now[:error] = "Unable to sign you in."
			flash.alert = "Unable to log you in.  Please try again."
			
			redirect_to new_seller_authentication_url
		end
		
	end

	def destroy
		session[:user_id] = nil
		
		redirect_to root_url,
	  	notice: "You signed out."
		
	end



end
