class Product < ApplicationRecord
	has_many :orders

	def order_count
		self.orders.count
	end

	def total_product_sales
		#self.orders
		bigtotal =0;
		
		self.orders do |order|
  			# do whatever
  			bigtotal += order.total
		end

		return bigtotal
	end
end
