class AuthenticationsController < ApplicationController
	#only call into
	before_action :authenticate_seller_user, only: [:destroy]


	def new
		# are they already logged in?
		if current_user #they are!  can't create them again
			redirect_to seller
		end
	end	


	def create
			seller = Seller.find_by(email: params[:seller][:email])
		# if user
		if user != nil
			#authenticate user and then redirect them to user profile page
			if seller_user.authenticate(params[:seller][:password])
				session[:seller_id] = seller.id
				redirect_to seller
			end
		else
			flash.now[:error] = "Unable to sign you in."
			# render :new
			redirect_to new_seller_path
		end
		# end
	end

	def destroy
		session[:seller_id] = nil
		redirect_to logout_path
		
	end

end