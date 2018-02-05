class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_path }
    end
  end

  def client_params
    params.require(:client).permit(:name, :phone)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
