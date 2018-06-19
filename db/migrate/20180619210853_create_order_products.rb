class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
  	create_table :orders_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.decimal :unit_price, precision: 5, scale: 2
      t.integer :quantity
      t.timestamps
    end
  end
end
