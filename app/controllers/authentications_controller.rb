class AuthenticationsController < ApplicationController

#only call into

before_action :authenticate_customer_user, only: [:destroy]
# before you log out(destroy) ... you must first authenticate the user


def new

	if current_customer_user
		# redirect_to users_url
		redirect_to customers_url
	else
		@customer = Customer.new
		# redirect_to users_results_url
		render :new
	end
end

def show
end



def create
	
	customer = Customer.find_by(customer_email: params[:customer][:customer_email])
	# if user
	if customer != nil
		# if customer.authenticate(params[:customer][:password])
		if customer.authenticate(params[:customer][:customer_password])  
		session[:customer_user_id] = customer.id
		


		redirect_to customer
		# redirect_to root_url

			# if current_user.triggers[0] == nil
			# unless current_user.triggers.any?
			# # redirect_to users_user.id_triggers

			# redirect_to new_user_trigger_url(user.id)

			# else
			# redirect_to triggers_maindisplay_url
			# end
	    end
	else
		# flash.alert = "Unable to log you in.  Please try again."
		# flash.now.alert = "Unable to log you in. Please try again."
		# render :new
		Rails.logger.debug "Unable to log you in. Please try again."
		# Rails.logger.debug "#{my_hash.inspect}"
		# render :create
		# flash[:notice] = "Unable to log you in. Please try again."
		redirect_to new_authentication_url
		# redirect_to root_url
	end
end


def destroy


	session[:customer_user_id] = nil

	session[:order_id] = nil

	# redirect_to root_url,
	# redirect_to authentications_url,
	# redirect_to authentications_new_url,
	redirect_to new_authentication_url,
	  notice: "You signed out."
end



end