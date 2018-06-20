class CreateProductsPerOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :products_per_orders do |t|
       t.integer :order_id
       t.integer :product_id
       t.decimal :unit_price, precision: 5, scale: 2
       t.integer :quantity
       t.timestamps
    end
  end
end