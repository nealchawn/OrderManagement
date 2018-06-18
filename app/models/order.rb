class Order < ApplicationRecord
	belongs_to :product

	def total
		self.product.price.to_f * self.quantity
		#return "hello"
	end

end
