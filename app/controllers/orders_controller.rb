class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_path }
    end
  end

  def order_params
    params.require(:order).permit(:client_id, order_products_attributes: [:id, :product_id, :quantity, :_destroy])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
