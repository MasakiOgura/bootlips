class TodoController < ApplicationController
  before_filter :login_required
  
  def index
    @tasks = Task.find_tasks(session[:userID])
  end

  def new
    @task = Task.new
  end

  def delete
    task = Task.find(params[:id])
    task.task_status_id = "0"
    task.save
   
    #Task.find(params[:id]).destroy
    redirect_to :action => "index"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = session[:userID]

    if @task.save
      redirect_to :action => "index"
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.user_id = session[:userID]
    
    if @task.update_attributes(params[:task])
      redirect_to :action => "index"
    end
  end

end
