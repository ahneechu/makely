class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :store

      validates :order_number, numericality: {greater_than: 0}
end