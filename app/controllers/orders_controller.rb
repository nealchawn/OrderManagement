class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :add_item]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order("id")
    @top_order = Order.top_order.id
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def add_item
    
  end

  # POST /orders
  # POST /orders.json
  def create
    #params[:order][:item].insert(0,'[')
    #items = params[:order][:item]+']'
    #items = Order.makeorder(eval(items))
    @order = Order.new(order_params)

    respond_to do |format|
      #if Order.place_order(params[:order][:address], items)
      # just shipping address


      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    #params[:order][:item].insert(0,'[')
    #items = params[:order][:item]+']'
    #items = Order.makeorder(eval(items))
    #@order.add_items(items)
    #params[:order].delete("item")
    #params[:order].delete("quan")


    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to edit_order_path(params[:id]), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def destroyitem
    #@order.products_per_orders.find(params[:id).destroy
    ProductsPerOrder.find(params[:ppoid]).destroy
    order = Order.find(params[:order_id])
    order.total_price = nil;
    totalprice = order.total
    order.update(total_price: totalprice)

    respond_to do |format|
      format.html { redirect_to orders_path, notice: 'Order Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :item, :shipped_on)
    end
end
