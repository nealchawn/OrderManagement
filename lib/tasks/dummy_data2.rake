namespace :dummy_data2 do
  desc "create dummy data for orders"
  task :create => :environment do
    require 'date'
    product_count = Product.all.count
    product_offset = Product.first.id
    d = Date.today
    (1..100).to_a.each do |i|
      a =[]
      (1..3).to_a.each do |d|
        product = Product.find(Random.rand(product_offset..(product_count+product_offset-1)))
        quantity = Random.rand(1..35)
        a.push({product: product, quantity: quantity})
      end
      o = Order.place_order("address #{i}", a)
      #d = d.next_day
      puts "address #{i} - #{a}"
    end
  end 
end

