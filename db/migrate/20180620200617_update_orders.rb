class UpdateOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :total_price, :decimal, precision: 5, scale: 2
  	remove_column :orders, :quantity, :integer
  	remove_column :orders, :order_product_id, :integer
  end
end
