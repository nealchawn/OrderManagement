require "application_system_test_case"

class ProductsPerOrdersTest < ApplicationSystemTestCase
  setup do
    @products_per_order = products_per_orders(:one)
  end

  test "visiting the index" do
    visit products_per_orders_url
    assert_selector "h1", text: "Products Per Orders"
  end

  test "creating a Products per order" do
    visit products_per_orders_url
    click_on "New Products Per Order"

    fill_in "Order", with: @products_per_order.order_id
    fill_in "Product", with: @products_per_order.product_id
    fill_in "Quantity", with: @products_per_order.quantity
    fill_in "Unit Price", with: @products_per_order.unit_price
    click_on "Create Products per order"

    assert_text "Products per order was successfully created"
    click_on "Back"
  end

  test "updating a Products per order" do
    visit products_per_orders_url
    click_on "Edit", match: :first

    fill_in "Order", with: @products_per_order.order_id
    fill_in "Product", with: @products_per_order.product_id
    fill_in "Quantity", with: @products_per_order.quantity
    fill_in "Unit Price", with: @products_per_order.unit_price
    click_on "Update Products per order"

    assert_text "Products per order was successfully updated"
    click_on "Back"
  end

  test "destroying a Products per order" do
    visit products_per_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Products per order was successfully destroyed"
  end
end
