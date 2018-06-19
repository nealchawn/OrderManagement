namespace :dummy_data2 do
  desc "create dummy data for orders"
  task :create => :environment do
    require 'date'
    product_count = Product.all.count
    product_offset = Product.first.id
    d = Date.today
    (1..100).to_a.each do |i|
      product_id = Random.rand(product_offset..(product_count+product_offset-1))
      quantity = Random.rand(1..50)
      o = Order.create(product_id: product_id, quantity: quantity, shipped_on: d)
      d = d.next_day
      puts "#{o.product_id} - #{o.quantity} - #{o.shipped_on}"
    end
  end 
end

