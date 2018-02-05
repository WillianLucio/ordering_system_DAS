require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @client = create(:client)
      @client2 = create(:client)

      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns all clients correctly" do
      expect(assigns(:clients).size).to eq(2)
      expect(assigns(:clients)[0].id).to eq(@client.id)
      expect(assigns(:clients)[1].id).to eq(@client2.id)
    end
  end

  describe "GET #create" do
    context "with data correct" do
      before(:each) do
        @client = build(:client)
        post :create, params: {client: @client.attributes}
      end

      it "redirect to clients_path" do
        expect(response).to redirect_to(clients_path)
      end

      it "client created with data correct" do
        expect(Client.last.name).to eql(@client.name)
        expect(Client.last.phone).to eql(@client.phone)
      end
    end

    it "returns status 422 with the wrong data" do
      client = build(:client, name: "", phone: "")
      post :create, params: {client: client.attributes}
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
      @client = create(:client)
      get :edit, params: {id: @client.id}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returned the client correct" do
      expect(assigns(:client).id).to eq(@client.id)
    end
  end

  describe "GET #update" do
    context "with correct datas" do
      before(:each) do
        @client = create(:client)
        @client_attributes = attributes_for(:client)
        put :update, params: {id: @client.id, client: @client_attributes}
      end

      it "redirect to clients_path" do
        expect(response).to redirect_to(clients_path)
      end

      it "client updated correctly" do
        expect(Client.last).to have_attributes(@client_attributes)
      end
    end

    it "returns status 422 with the wrong data" do
      client = create(:client)
      client.name = ""
      client.phone = ""
      put :update, params: {id: client.id,  client: client.attributes}
      expect(response).to have_http_status(422)
    end
  end

  describe "GET #destroy" do
    before(:each) do
      @client = create(:client)
      delete :destroy, params: {id: @client.id}
    end

    it "returns http success" do
      expect(response).to redirect_to(clients_path)
    end

    it "client was excluded" do
      expect(Client.all).to_not include(@client)
    end
  end
end
