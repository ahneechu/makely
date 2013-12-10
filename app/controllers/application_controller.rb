class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception




  	def current_user
		if session[:user_id]
			@current_user ||= Seller.find_by(id: session[:user_id])

		end
	end


	def current_customer_user
		if session[:customer_user_id]
			@current_customer_user ||= Customer.find_by(id: session[:customer_user_id])
		end
	end


	def authenticate_user
		redirect_to seller_authentications_new_url unless current_user
	end

	def authenticate_customer_user
		redirect_to customer_authentications_new_url unless current_customer_user
	end


	helper_method :current_user
	helper_method :current_customer_user

end





