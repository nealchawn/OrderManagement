class ProductsPerOrder < ApplicationRecord
	belongs_to :order
	belongs_to :product

	def self.top_sold_product
		ProductsPerOrder.select("product_id, SUM(quantity) as total_quantity").group("product_id")[0].total_quantity
	end

end
