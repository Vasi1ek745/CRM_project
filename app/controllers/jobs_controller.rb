class JobsController < ApplicationController
  def index
    @jobs = Job.all.order(:date)
 
    @client = Client.last
    
  end

  def show
  end

  def new
    @client = Client.last
    @job = Job.new
    @clients = Client.order(:name )
    
  end

  def create
   @client = Client.find_by(params[:client_name])
   @job = @client.jobs.build(job_form)

   @job.save
   redirect_to jobs_path

   

  end

  def edit
    @job = Job.find(params[:id])
    @client = @job.client
    @clients = Client.all
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
    @jobs = Job.all
    @client = Client.last
    @job = Job.new
    @clients = Client.order(:name )

  end



  private
    def job_form
      h = params.require(:job).permit(:name,:cost, :place, :comments, :client_id, :date, :hour,:minute, :duration) 
      h[:start_time] = Time.at(3600*h[:hour].to_i + 60*h[:minute].to_i)
      
      h.delete(:hour); h.delete(:minute); 
      h  
    end

end
  

