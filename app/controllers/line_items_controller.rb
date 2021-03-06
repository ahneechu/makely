class LineItemsController < ApplicationController
	include CurrentOrder
	before_action :set_order, only: [:create]
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]

	#Get / line_items
	#

	def new
		@line_item = LineItem.new
	end


	def index
		@line_items = LineItem.all
	end


	def show
		@line_item = LineItem.find(params[:id])
	end


	def create
	# fail

	# current_customer_user.order == nil
	# create a new cart - create
	# user & cart
	# user has one cart
	# place the order - delete the cart
	# current_customer_user.order.last
	# current_customer_user.customer_order -> use this instead of current order


	#Add boolean to database field - orders open/close
	#why the current_order_id missing from the session or the params; wrong value in the session?

	# we don't use this because the before action does set_order - sets the current order
	# @order = Order.find(params[:order_id])
	# puts @order.inspect 


	product = Product.find(params[:product_id])

	# Book method - the following does cart line items
# 	puts "HERE "+ @line_item.inspect
	@line_item = @order.add_product(product.id)
# puts "HERE 2 "+ @order.inspect
# puts "HERE 3 "+ @line_item.inspect


	# the following is the working line
	# @line_item = @order.line_items.build(product: product)


	# if @order.line_items.product.find_by product_id: 'product'
	# 	@line_item = @order.line_item.product
	# 	@line_item.product_quantity_ordered += 1
	# 	@line_item.save
	# else
	# 	@line_item = @order.line_items.build(product: product)
	# end



	# Ira Brainstorm: 
	# something like: if @order.line_items.product.find_by(product_id: product) == product
	# 	@line_item = @order.line_item.product
	# 	@line_item.product_quantity_ordered += 1
	# 	@line_item.save
	# else
	# 	@line_item = @order.line_items.build(product: product)
	# end

	

	# @line_item = @order.line_items.build(product: product, order: @order)
	# puts @line_item.inspect


		respond_to do |format|
			if @line_item.save
				# format.html {redirect_to @line_item.order,


				#*This is a Test just to check route
				# format.html {redirect_to customer_order_url(5, @order.id),
				format.html {redirect_to customer_order_url(current_customer_user.id, @order.id),
				  notice: 'Line item was successfully created'}
				format.json { render action: 'show',
				  status: :created, location: @line_item }
			else
				format.html { render action: 'new' }
				format.json { render json: @line_item.errors,
				  status: :unprocessable_entity }
			end
		end
	end

	def edit
     	@line_item = LineItem.find(params[:id])
  	end

  	def update
  		@line_item.update(line_items_params)
  		redirect_to line_items_url
  	end

  	 def destroy
  	 	Customer.find(params[:id]).destroy
		# @customer.destroy
		redirect_to line_items_url
		end







private
    # Use callbacks to share common setup or constraints between actions.

    def set_line_item
      @line_item = LineItem.find(params[:id])
          # respond_with (@customers)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_items_params
      # params.require(:line_item).permit!

      params.require(:line_item).permit(:product_id)

    end


end


