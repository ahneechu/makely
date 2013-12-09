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
		
		if @customer.save
			redirect_to customers_url
		end

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

