class ClientsController < ApplicationController
  before_action :user

  
  def index
    
    if user_signed_in?
      @pagy,@clients = pagy(@user.clients.order(created_at: :desc), items: 9) 
    end
    # @clients = Client.order(created_at: :desc)
  end


  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params.merge({user_id: @user.id}))
     if @client.save
        redirect_to clients_path
        flash["success"] = "Client create!"
    else
        @errors = @client.errors
        flash["warning"] = "Errors!"
        render :new
    end

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
    flash["danger"] = "Client delete"

  end


  private
    def client_params
      params.require(:client).permit(:name,:surname, :phone_number, :email, :comments)
    end
    def user
      @user = current_user
    end
end
