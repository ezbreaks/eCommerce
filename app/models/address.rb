class Address < ActiveRecord::Base
	belongs_to :user
	has_many :orders

	def compact
		addresses.collect{|a| [a.to_s, a.line1]}
	end
end
