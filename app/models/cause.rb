class Cause < ActiveRecord::Base
	has_many :stores
	has_many :products, through: :stores, class_name: "Product"
end
