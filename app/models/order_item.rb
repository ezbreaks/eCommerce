class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	validates_presence_of :order_id
	validates_presence_of :product_id
end
