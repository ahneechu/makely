class CustomersController < ApplicationController
before_action :set_customer, only: [:show, :edit, :update, :destroy]

	def new
		@customer = Customer.new
	end

	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def create
		@customer = Customer.new(params.require(:customer).permit(:customer_username, :customer_email, :customer_password, :password_confirmation))
		@customer.save
		customer = Customer.find_by(customer_email: params[:customer][:customer_email])
		
		
			if customer.authenticate(params[:customer][:customer_password])  
			session[:customer_user_id] = customer.id
        		redirect_to root_url
        	end
  		
  			# customer = Customer.find_by(email: params[:customer][:customer_email])
  			# if customer.authenticate(params[:customer][:customer_password]) 
			# if customer.authenticate(params[:customer_username][:customer_password])
   #      		session[:customer_user_id] = current_customer_user.id

		# if @customer.save
		# 	redirect_to root_url
		# end
	end

		def edit
	     	@customer = Customer.find(params[:id])
	  	end

	  	def update
	  		@customer.update(customer_user_params)
	  		redirect_to customers_url
	  	end

	  	 def destroy
	  	 	Customer.find(params[:id]).destroy
    		# @customer.destroy
    		redirect_to customers_url
  		end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
          # respond_with (@customers)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_user_params
      params.require(:customer).permit(:customer_email, :customer_hashed_password, :password_confirmation)
    end



end

