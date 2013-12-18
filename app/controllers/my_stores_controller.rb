class MyStoresController < ApplicationController

	def index
		
	end

	def show
		@store = current_user.store
	end

end
