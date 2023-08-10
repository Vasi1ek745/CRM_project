class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit
      @client = Client.find(params[:id])
  end

  def update
      @client = Client.find(params[:id])
      @client.update(client_params)
      redirect_to clients_path
  end

  def destroy
    @client = Client.find(params[:id])
    @client.delete
    redirect_to clients_path
  end


  private
    def client_params
      params.require(:client).permit(:name,:surname, :phone_number, :email, :comments)
    end
end
