require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @product = create(:product)
      @product2 = create(:product)

      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns all products correctly" do
      expect(assigns(:products).size).to eq(2)
      expect(assigns(:products)[0].id).to eq(@product.id)
      expect(assigns(:products)[1].id).to eq(@product2.id)
    end
  end

  describe "GET #create" do
    context "with data correct" do
      before(:each) do
        @product = build(:product)
        post :create, params: {product: @product.attributes}
      end

      it "redirect to products_path" do
        expect(response).to redirect_to(products_path)
      end

      it "product created with data correct" do
        expect(Product.last.description).to eql(@product.description)
        expect(Product.last.value).to eql(@product.value)
      end
    end

    it "returns status 422 with the wrong data" do
      product = build(:product, description: "", value: 0)
      post :create, params: {product: product.attributes}
      expect(response).to have_http_status(422)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    before(:each) do
      @product = create(:product)
      get :edit, params: {id: @product.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returned the product correct" do
      expect(assigns(:product).id).to eq(@product.id)
    end
  end

  describe "GET #update" do
    context "with correct datas" do
      before(:each) do
        @product = create(:product)
        @product_attributes = attributes_for(:product)
        put :update, params: {id: @product.id, product: @product_attributes}
      end

      it "redirect to products_path" do
        expect(response).to redirect_to(products_path)
      end

      it "product updated correctly" do
        expect(Product.last).to have_attributes(@product_attributes)
      end
    end

    it "returns status 422 with the wrong data" do
      product = create(:product)
      product.description = ""
      product.value = 0
      put :update, params: {id: product.id,  product: product.attributes}
      expect(response).to have_http_status(422)
    end
  end

  describe "GET #destroy" do
    before(:each) do
      @product = create(:product)
      delete :destroy, params: {id: @product.id}
    end

    it "returns http success" do
      expect(response).to redirect_to(products_path)
    end

    it "product was excluded" do
      expect(Product.all).to_not include(@product)
    end
  end
end
