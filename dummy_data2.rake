namespace :dummy_data2 do
  require 'date'
  desc "create dummy data for orders"
  task :create => :environment do
    product_count = Product.all.count;
    product_offset = Product.first.id;
    d = DateTime.now
    (1..100).to_a.each do |i|
      product_id = Random.rand(product_offset..(product_offset+product_count-1))
      quantity = Random.rand(1..50)
      o = Order.create(product_id: product_id, quantity: quantity, order_created_on: d)
      d = d.next_day()
      puts "#{o.product_id} - #{o.quantity} - #{o.order_created_on}"
    end
  end 
end

