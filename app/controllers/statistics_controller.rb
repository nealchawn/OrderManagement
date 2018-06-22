class StatisticsController < ApplicationController
	def products_index
	  @products = Product.all
      #sold the most of itself
      @top_sold_product = Product.top_sold_product.product_id
      #made the most money
      @top_product_sale = Product.top_product_sales.product_id
	end

	def orders_index
	@orders = Order.all
      #sold the most of itself
      @top_order = Order.top_order.id
	end


end
