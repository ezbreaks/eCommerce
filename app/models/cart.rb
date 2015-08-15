class Cart < ActiveRecord::Base
	has_one :orders
end
