Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :orders do
    resources :products_per_orders, :only => [:new, :index, :edit, :update, :show, :destroy] #except create
    post'/products_per_orders' => 'products_per_orders#add'
  end
  get'/ordersoverview' => 'statistics#orders_index'
  get'/productsoverview' => 'statistics#products_index'
  #get'/orders/:ppoid/:order_id'=>'orders#destroyitem', as: 'delete_order_product'
  #put'/orders/:id/order_id:'=>'orders#update', as: 'products_per_order'
end
