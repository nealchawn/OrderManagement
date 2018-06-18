class Product < ApplicationRecord
	has_many :orders

	def order_count
		self.orders.count
	end
end
