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
				total += product.unit_price.to_f * product.quantity
			end
			return total.round(2)
			#self.product.price.to_f * self.quantity
		else
			return self.total_price
		#return "hello"
	    end
	end

	def add_items(items)
		items.each do |order_item|			
			#puts "index #{i} value #{p}"
			product = order_item[:product]
            self.products_per_orders.create(product_id: product.id, unit_price: product.price, quantity: order_item[:quantity])
		end
		self.total_price = nil;
		totalprice = self.total
		self.update(total_price: totalprice)
	end

	def self.top_order
		Order.order("total_price DESC")[0]
	end

	def self.makeorder(items)
		items.each do |item|
		item[:product] = Product.find(item[:product])
		end
		return items
	end
	# address: string, items: hash
	# items = [
	# 	{product: Product, quantity: integer},
	# 	{product: Product, quantity: integer}
	# ]

	def self.place_order(address, items)
		newOrder = " "
		order = Order.create(address: address)
		items.to_a.each do |order_item|			
			#puts "index #{i} value #{p}"
			product = order_item[:product]
			newOrder = ProductsPerOrder.create(order_id: order.id, product_id: product.id, unit_price: product.price, quantity: order_item[:quantity])
		end
		totalprice = order.total
		puts "This is the total #{totalprice}"
		Order.update(order.id,total_price: totalprice)
	end

end
