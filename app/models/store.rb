class Store < ActiveRecord::Base
  has_many :sellers
  belongs_to :cause
end
