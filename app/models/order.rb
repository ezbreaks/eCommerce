class Order < ActiveRecord::Base
	has_many :order_items, dependent: :destroy
	belongs_to :user
	belongs_to :address

	def total_price
	order_items.to_a.sum { |item| item.total_price }
	end

	# def add_product(product_id)
 #    current_item = order.order_items.new(quantity: 1, product_id: params[:product_id])
    
	#     if current_item
	#       current_item.quantity += 1
	#       Rails.logger.debug(current_item.quantity)
	#     else
	#       current_item = order_items.build(:product_id => product_id)
	#     end
 #    	current_item
 #  	end
end
