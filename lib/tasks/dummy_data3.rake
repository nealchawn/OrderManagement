namespace :product_overview do
  desc "shows total sold and total sales for each product"
  task :query => :environment do

    products = Product.all
      puts"############################################"
      puts "  Product OverView"
      puts"############################################"
    products.each do |p|
      totalsale = p.total_product_sales.round(2)
      totalsold = p.total_product_sold
      totalorders = p.orders.count
      puts " "
      puts"############################################"
      puts "  product: #{p.name}"
      puts "     sold: #{totalsold}"
      puts "     total orders: #{totalorders}"
      puts "     total sales: #{totalsale}"
      puts"############################################"
      puts " "
    end
  end 
end


