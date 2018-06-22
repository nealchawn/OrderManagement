namespace :product_overview do
  desc "shows total sold and total sales for each product"
  task :query => :environment do

    products = Product.all
          #sold the most of itself
      top_sold_product = Product.top_sold_product.product_id
      #made the most money
      top_product_sale = Product.top_product_sales.product_id
      
      puts"############################################"
      puts "  Product OverView"
      puts"############################################"
    products.each do |p|
      totalsale = p.total_product_sales
      totalsold = p.total_product_sold
      totalorders = p.products_per_order.count


      
      if (p.id == top_product_sale)
        puts " "
        puts"############################################".yellow
        puts "  This Product Made the most in Sales".yellow
        puts "  product: #{p.name}".yellow
        puts "     sold: #{totalsold}".yellow
        puts "     total orders: #{totalorders}".yellow
        puts "     total sales: #{totalsale}".yellow
        puts"############################################".yellow
        puts " "
      elsif (p.id == top_sold_product)
        puts " "
        puts"############################################".red
        puts "  This Product Sold the Most".red
        puts "  product: #{p.name}".red
        puts "     sold: #{totalsold}".red
        puts "     total orders: #{totalorders}".red
        puts "     total sales: #{totalsale}".red
        puts"############################################".red
        puts " "
      elsif (p.id == top_sold_product && p.id == top_product_sale)
        puts " "
        puts"############################################".blue
        puts "  This Product Sold the Most And Made the Most in Sales!!!".blue
        puts "  product: #{p.name}".blue
        puts "     sold: #{totalsold}".blue
        puts "     total orders: #{totalorders}".blue
        puts "     total sales: #{totalsale}".blue
        puts"############################################".blue
        puts " "
      else
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
end


