class StoresController < ApplicationController
	def new
		@store = Store.new
	end

	def show
		@store = Store.find(params[:id])
	end

	def create
		@store = Store.new(store_params)
		
		if @store.save
			flash[:notice] = "Store created!"
			redirect_to @store
		end
	end

private
	def store_params
      	params.require(:store).permit(:store_name, :store_description, :store_image, :cause_id)
    end

end
