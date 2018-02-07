require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @order = create(:order)
      @order2 = create(:order)

      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns all orders correctly" do
      expect(assigns(:orders).size).to eq(2)
      expect(assigns(:orders)[0].id).to eq(@order.id)
      expect(assigns(:orders)[1].id).to eq(@order2.id)
    end
  end

  describe "GET #create" do
    context "with data correct" do
      before(:each) do
        @order = build(:order)
        post :create, params: {order: @order.attributes}
      end

      it "redirect to orders_path" do
        expect(response).to redirect_to(orders_path)
      end

      it "order created with data correct" do
        expect(Order.last.client_id).to eql(@order.client_id)
      end
    end

    it "returns status 422 with the wrong data" do
      order = build(:order, client_id: 0)
      post :create, params: {order: order.attributes}
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
      @order = create(:order)
      get :edit, params: {id: @order.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returned the order correct" do
      expect(assigns(:order).id).to eq(@order.id)
    end
  end

  describe "GET #update" do
    context "with correct datas" do
      before(:each) do
        @order = create(:order)
        @order_object = build(:order)
        put :update, params: {id: @order.id, order: @order_object.attributes}
      end

      it "redirect to orders_path" do
        expect(response).to redirect_to(orders_path)
      end

      it "order updated correctly" do
        expect(Order.last.client_id).to eql(@order_object.client_id)
      end
    end

    it "returns status 422 with the wrong data" do
      order = create(:order)
      order.client_id = 0
      put :update, params: {id: order.id,  order: order.attributes}
      expect(response).to have_http_status(422)
    end
  end

  describe "GET #destroy" do
    before(:each) do
      @order = create(:order)
      delete :destroy, params: {id: @order.id}
    end

    it "returns http success" do
      expect(response).to redirect_to(orders_path)
    end

    it "order was excluded" do
      expect(Order.all).to_not include(@order)
    end
  end
end
