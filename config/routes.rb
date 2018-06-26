Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :orders
  get'/ordersoverview' => 'statistics#orders_index'
  get'/productsoverview' => 'statistics#products_index'
  get'/orders/:ppoid/:order_id'=>'orders#destroyitem', as: 'delete_order_product'
  #put'/orders/:id/order_id:'=>'orders#update', as: 'products_per_order'
end
