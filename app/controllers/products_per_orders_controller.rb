class ProductsPerOrdersController < ApplicationController
  before_action :set_products_per_order, only: [:show, :edit, :update, :destroy]
  before_action :add_item_to_order, only: [:index, :new]
  #after_action :add, only:[set_products_per_order]
  # GET /products_per_orders
  # GET /products_per_orders.json
  def index
    @products_per_orders = ProductsPerOrder.all.where(order_id: params[:order_id])
    #@products_per_orders = ProductsPerOrder.all
  end

  # GET /products_per_orders/1
  # GET /products_per_orders/1.json
  def show
  end

  def add
    #order_id = params[:order_id]
    #item = Product.find(params[:item])
    #quantity = params[:quantity]
    #item = [order_id: order_id, product: item, quantity: quantity]
    respond_to do |format|
      if Order.add_item(products_per_order_params)
        format.html { redirect_to edit_order_path(params[:order_id]), notice: 'Products per order was successfully created.' }
        format.json { render :show, status: :created, location: @products_per_order }
      else
        format.html { render :new }
        format.json { render json: @products_per_order.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /products_per_orders/new
  def new
    #@products_per_order = ProductsPerOrder.new(order_id: params[:order_id])
  end

  # GET /products_per_orders/1/edit
  def edit
  end

  # POST /products_per_orders
  # POST /products_per_orders.json
  def create
    @products_per_order = ProductsPerOrder.new(products_per_order_params)

    respond_to do |format|
      if @products_per_order.save
        format.html { redirect_to order_products_per_orders_url(params[:order_id]), notice: 'Products per order was successfully created.' }
        format.json { render :show, status: :created, location: @products_per_order }
      else
        format.html { render :new }
        format.json { render json: @products_per_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_per_orders/1
  # PATCH/PUT /products_per_orders/1.json
  def update
    respond_to do |format|
      if @products_per_order.update(products_per_order_params)
        format.html { redirect_to order_products_per_orders_url(params[:order_id]), notice: 'Products per order was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_per_order }
      else
        format.html { render :edit }
        format.json { render json: @products_per_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_per_orders/1
  # DELETE /products_per_orders/1.json
  def destroy
    @products_per_order.destroy
    o = @products_per_order.order
    o.update_price
    respond_to do |format|
      format.html { redirect_to edit_order_path(params[:order_id]), notice: 'Products per order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_per_order
      @products_per_order = ProductsPerOrder.find(params[:id])
    end

    def add_item_to_order
      @products_per_order = ProductsPerOrder.new(order_id: params[:order_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def products_per_order_params
      #this returns all the items in products_per_order hash
      params.require(:products_per_order).permit(:order_id, :product_id, :unit_price, :quantity)
    end
end
