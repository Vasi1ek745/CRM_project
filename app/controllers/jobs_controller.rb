class JobsController < ApplicationController
  before_action :user


  def index

    # if params[:show_past_jobs] == 0
    #   @jobs = Job.order(:date)
    # else     
    #   @jobs = Job.where("date >= ? ", Date.current ).order(:date)
    # end


    @jobs = current_user.jobs.order(:date)

    @job = Job.new
    
    @client = Client.last
    
  end


  def new
    @client = Client.last
    @job = Job.new
    @clients = current_user.clients.order(:name )
    
  end

  def create
     @client = Client.find_by(params[:client_name])
     @clients = current_user.clients.order(:name )
    
     @job =Job.create(job_form.merge({user_id: @user.id}))
    if @job.save
      flash["success"] = "Job create!"
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @client = @job.client
    @clients = current_user.clients.order(:name )
  end

  def update
    @job = Job.find(params[:id])
    
    if    @job.update(job_form)
        redirect_to jobs_path
    else 
      render edit
    end
  
  end

  def destroy
    @jobs = Job.find(params[:id])
    @jobs.delete
    redirect_to jobs_path
  end
  def calendar
    @jobs = @user.jobs
    @client = @user.clients.last
    @job = Job.new
    @clients = @user.clients.order(:name )

  end



  private
   
    def job_form
      h = params.require(:job).permit(:name,:cost, :place, :comments, :client_id, :date, :hour,:minute, :duration) 
      h[:duration] = h[:duration].gsub(",",".")
      h[:start_time] = Time.at(3600*h[:hour].to_i + 60*h[:minute].to_i)
      
      h.delete(:hour); h.delete(:minute); 
      h  
    end
    def user
      @user = current_user
    end

end
  

