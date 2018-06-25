json.extract! order, :id, :address, :shipped_on, :total_price, :created_at, :updated_at
json.url order_url(order, format: :json)
