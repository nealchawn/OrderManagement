class Product < ApplicationRecord
	has_many :orders

	def order_count
		self.orders.count
	end

	def total_product_sales
		bigtotal =0;
		self.orders.each do |ord|
  			# do whatever
  			bigtotal += ord.total
		end
		return bigtotal.round(2)
	end

	def total_product_sold
		#self.orders
		quan =0;
		
		self.orders.each do |order|
  			# do whatever
  			quan += order.quantity
		end

		return quan
	end

	def total_product_sales_for_date_range(d,d2)
		#require 'date'
		d = Date.today
		#d & d2 in datetime format
		bigtotal = 0;
	    quantity =0;
	    list = self.orders.where(["(shipped_on > :date1) and (shipped_on < :date2)",{date1: d, date2: d2}])
	    list.each do |o|
	      bigtotal += o.total
	      quantity += o.quantity;
	    end
	     return bigtotal.round(2)
	 end

end
