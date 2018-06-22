class ChangeNumericFieldInOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :total_price, :decimal, :precision => 10, :scale => 2
  end
end
