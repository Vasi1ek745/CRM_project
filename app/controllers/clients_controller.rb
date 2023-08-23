class ClientsController < ApplicationController
  def index

    @pagy,@clients = pagy(Client.order(created_at: :desc), items: 9)

    # @clients = Client.order(created_at: :desc)
  end
  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
     @client.save
    redirect_to clients_path
  end

  def edit
      @client = Client.find(params[:id])
      @jobs = @client.jobs.order(:date)
  end

  def update
      @client = Client.find(params[:id])
      @client.update(client_params)
      redirect_to clients_path
  end

  def destroy
    @client = Client.find(params[:id])
    @client.jobs.delete_all
    @client.delete

    redirect_to clients_path

  end


  private
    def client_params
      params.require(:client).permit(:name,:surname, :phone_number, :email, :comments)
    end
end
