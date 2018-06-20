class Order < ApplicationRecord
	has_many :products_per_orders
	has_many :products, :through => :products_per_orders

	items=[]
	address=""
	def total
		if(self.total_price == nil)
			total=0
			@order = ProductsPerOrder.where("order_id = #{self.id}")
			@order.each do |product|
				total += product.unit_price * product.quantity
			end
			return total
			#self.product.price.to_f * self.quantity
		else
			return self.total_price
		#return "hello"
	    end
	end

	def self.order(address, items)
		@order = Order.create(address: address)
		items.each_with_index do |p , i|
			if (i == 0)
			else
				#puts "index #{i} value #{p}"
				@product = Product.find(i)
				@newOrder = ProductsPerOrder.create(order_id: @order.id, product_id: @product.id, unit_price: @product.price, quantity: p)
			end
		end
		totalprice = @order.total
		Order.update(@newOrder.order_id,total_price: totalprice)
	end

	def self.top_sold_product
		#Order.select("product_id, count(product_id)").group("product_id, id").first
	end

end
