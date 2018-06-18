namespace :dummy_data do
  desc "create dummy data"
  task :create => :environment do
    prices = [9.99, 19.99, 24.99, 49.99]
    names = ["Mixer", "Drum Machine", "Keyboard"]
    (1..100).to_a.each do |i|
      name = "#{names[i%3]} #{i}"
      price = prices[i%4]
      p = Product.create(name: name, price: price)
      puts "#{p.name} - #{p.price}"
    end
  end 
end
