class Order < ApplicationRecord
	belongs_to :product

	def total
		self.product.price.to_f * self.quantity
		#return "hello"
	end

	def self.top_sold_product
		Order.select("product_id, count(product_id)").group("product_id, id").first
	end

end
