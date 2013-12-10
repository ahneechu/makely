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
		puts @order.inspect 
		product = Product.find(params[:product_id])
		@line_item = @order.line_items.build(product: product)
		# @line_item = @order.line_items.build(product: product, order: @order)


		respond_to do |format|
			if @line_item.save
				# format.html {redirect_to @line_item.order,

				#This is a Test just to check route
				format.html {redirect_to customer_order_url(5, @order.id),
				# format.html {redirect_to customer_order_url(customer_id, order_id),
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
      params.require(:line_item).permit!

    end


end


