class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_path }
    end
  end
  
  def product_params
    params.require(:product).permit(:description, :value)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
