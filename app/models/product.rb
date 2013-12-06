class Product < ActiveRecord::Base
  belongs_to :cateogry
  belongs_to :store
end
