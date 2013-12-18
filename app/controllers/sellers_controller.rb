class SellersController < ApplicationController
	before_action :set_seller, only: [:show, :edit, :update, :destroy]

	# GET /sellers
	# GET /sellers.json
	def index
	   @sellers = Seller.all
	end

	# GET /sellers/1
  	# GET /sellers/1.json
	def show
		@seller = Seller.find(params[:id])
		@store = Seller.find(set_seller).store

	end

	# GET /sellers/new
	def new
		@seller = Seller.new
	end

	# GET /sellers/1/edit
	def edit
	end

	# POST /sellers
  	# POST /sellers.json	
	def create
		@seller = Seller.new(seller_params)
		@seller.save
		# @customer = Customer.new(params.require(:customer).permit(:customer_username, :customer_email, :customer_password, :password_confirmation))
		# @customer.save
		seller = Seller.find_by(email: params[:seller][:email])
		
		respond_to do |format|
	      # if @seller.save
	      if seller.authenticate(params[:seller][:password])  
			session[:user_id] = seller.id

	        format.html { redirect_to @seller, notice: 'Seller was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @seller }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @seller.errors, status: :unprocessable_entity }
	      end
	    end

	    # if @seller.save
		# 	flash[:notice] = "Seller created!"
		# 	redirect_to @seller
		# 	else
		# 	flash[:notice] = "Error.  Please resubmit"
		# 	redirect_to new_seller_path
  #   	end

		# seller = Seller.find_by(seller_username: params[:seller][:seller_username])
	 # 	if seller.authenticate(params[:seller][:password])
	 #        session[:seller_id] = seller.id
	 #        flash[:notice] = "Seller created!"
	 #        redirect_to @seller
	# end
  	end

	# PATCH/PUT /sellers/1
	  # PATCH/PUT /sellers/1.json
	  def update
	    respond_to do |format|
	      if @seller.update(seller_params)
	        format.html { redirect_to @seller, notice: 'seller was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @seller.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /sellers/1
	  # DELETE /sellers/1.json
	  def destroy
	    @seller.destroy
	    respond_to do |format|
	      format.html { redirect_to sellers_url }
	      format.json { head :no_content }
	    end
	  end


private

	def set_seller
      @seller = Seller.find(params[:id])
    end

	def seller_params
      	params.require(:seller).permit(:seller_username, :email, :password, :password_confirmation, :store_id)
    end
end
