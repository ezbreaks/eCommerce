class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	validates :order_id, :product_id, presence: true
	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
	
	def total_price
		product.price * quantity
	end
end
