module ProductsHelper
	def print_price(price)
		number_to_currency price
	end

	def print_stock(stock)
		if stock > 0
			content_tag(:div, "In Stock", class: "in_stock")
		else
			content_tag(:div, "Out of stock", class: "out_stock")
		end
	end
end
