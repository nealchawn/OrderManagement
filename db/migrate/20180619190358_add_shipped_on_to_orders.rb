class AddShippedOnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipped_on, :date
  end
end
