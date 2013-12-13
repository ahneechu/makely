class ImagesController < ApplicationController
	# @http_method XHR POST
	# @url /documents
	def create
	  @image = Image.new(image_params)
	  # make sure to save image
	end

	

private
	def image_params
		params.require(:image).permit(:direct_upload_url)
	end
end
