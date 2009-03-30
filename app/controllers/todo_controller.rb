class TodoController < ApplicationController
  protect_from_forgery :secret => 'New-York-is-Mine', :only => :index

  
  def index
    @tasks = Task.find_tasks
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

    if @task.save
      redirect_to :action => "index"
    end
  end

end
