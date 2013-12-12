class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :store
  has_many :images

 #  validates :product_name, :product_description, :product_image, presence: true
 #  validates :product_price, numericality: {greater_than_or_equal_to: 0.01}
 #  validates :image_url, allow_blank: true, format: {
 #    with:    %r{\.(gif|jpg|png)\Z}i,
	# message: 'must be a URL for GIF, JPG or PNG image.' }
end
