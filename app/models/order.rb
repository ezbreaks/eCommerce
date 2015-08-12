class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :cart
	has_many :order_items
end
