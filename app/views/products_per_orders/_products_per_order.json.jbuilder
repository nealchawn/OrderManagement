json.extract! products_per_order, :id, :order_id, :product_id, :unit_price, :quantity, :created_at, :updated_at
json.url products_per_order_url(products_per_order, format: :json)
