class Order < ActiveRecord::Base
	has_many :order_items
	

	def total_price
	order_items.to_a.sum { |item| item.total_price }
	end

end
