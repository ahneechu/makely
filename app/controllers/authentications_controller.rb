class AuthenticationsController < ApplicationController

#only call into

before_action :authenticate_customer_user, only: [:destroy]
# before you log out(destroy) ... you must first authenticate the user


	def new

		if current_customer_user
			redirect_to root_url
		else
			@customer = Customer.new
			render :new
		end
	end


	def show
	end



	def create
		
		customer = Customer.find_by(customer_email: params[:customer][:customer_email])
		
		if customer != nil
			
			if customer.authenticate(params[:customer][:customer_password])  
			session[:customer_user_id] = customer.id
			
			redirect_to root_url

		    end
		else
			flash.alert = "Unable to log you in.  Please try again."

			Rails.logger.debug "Unable to log you in. Please try again."

			redirect_to new_authentication_url
			
		end
	end


	def destroy


		session[:customer_user_id] = nil

		session[:order_id] = nil

		redirect_to root_url,
		  notice: "You signed out."
	end



end