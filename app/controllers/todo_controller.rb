class TodoController < ApplicationController
  before_filter :login_required
  
  def index
    @tasks = Task.find_by_uid(session[:userID])
  end

  def list
    @tasks = Task.find_by_list_id(params[:id])

  end

  def new
    @task = Task.new
  end

  def delete
    task = Task.find(params[:id])
    task.task_status = "0"
    task.save
   
    #Task.find(params[:id]).destroy
    redirect_to :action => "index"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    @task[:tag_list] = session[:tag_list]
    @task[:user_id] = session[:userID]

    if @task.save
      redirect_to :action => "index"
    else
      flash[:notice] = "登録に失敗しました"
      redirect_to :action => "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])

    if @task.save
      flash[:notice] = @task
      redirect_to :action => "index"
    else
      flash[:notice] = "更新に失敗しました"
      redirect_to :action => "update"
    end
  end

end
