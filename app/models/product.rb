class Product < ApplicationRecord
	has_many :products_per_order
	has_many :orders, :through => :products_per_order

	def order_count
		self.products_per_order.count
	end

	def total_product_sales
		list = self.products_per_order
		bigtotal =0
	    list.each do |o|
	      bigtotal += (o.unit_price*o.quantity)
	    end
	    return bigtotal.round(2)
	end

	def total_product_sold
		#self.orders
		quan =0;
		
		self.products_per_order.each do |order|
  			# do whatever
  			quan += order.quantity
		end

		return quan
	end

	def self.top_product_sales
		ProductsPerOrder.select("product_id, SUM(quantity * unit_price) AS total_sales").group("product_id").order("total_sales DESC")[0]
	end

	def self.top_sold_product
		ProductsPerOrder.select("product_id, SUM(quantity) as total_quantity").group("product_id").order("total_quantity DESC")[0]
	end

	def total_product_sales_for_date_range(d,d2)
		#require 'date'
		#d = Date.today
		#d & d2 in datetime format
		bigtotal = 0;
	    quantity =0;
	    list = self.products_per_order.where(["(created_at > :date1) and (created_at < :date2)",{date1: d, date2: d2}])
	    list.each do |o|
	      bigtotal += (o.unit_price*o.quantity)
	    end
	     return bigtotal.round(2)
	 end

end
