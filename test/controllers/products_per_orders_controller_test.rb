require 'test_helper'

class ProductsPerOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @products_per_order = products_per_orders(:one)
  end

  test "should get index" do
    get products_per_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_products_per_order_url
    assert_response :success
  end

  test "should create products_per_order" do
    assert_difference('ProductsPerOrder.count') do
      post products_per_orders_url, params: { products_per_order: { order_id: @products_per_order.order_id, product_id: @products_per_order.product_id, quantity: @products_per_order.quantity, unit_price: @products_per_order.unit_price } }
    end

    assert_redirected_to products_per_order_url(ProductsPerOrder.last)
  end

  test "should show products_per_order" do
    get products_per_order_url(@products_per_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_products_per_order_url(@products_per_order)
    assert_response :success
  end

  test "should update products_per_order" do
    patch products_per_order_url(@products_per_order), params: { products_per_order: { order_id: @products_per_order.order_id, product_id: @products_per_order.product_id, quantity: @products_per_order.quantity, unit_price: @products_per_order.unit_price } }
    assert_redirected_to products_per_order_url(@products_per_order)
  end

  test "should destroy products_per_order" do
    assert_difference('ProductsPerOrder.count', -1) do
      delete products_per_order_url(@products_per_order)
    end

    assert_redirected_to products_per_orders_url
  end
end
