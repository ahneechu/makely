class Store < ActiveRecord::Base
  belongs_to :cause
  has_many :sellers
  has_many :orders
  
end
