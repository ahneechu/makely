class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :store
  has_many :line_items, dependent: :destroy

      # validates :order_number, numericality: {greater_than: 0}
end
