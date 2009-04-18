class ProjectController < ApplicationController
  def index
    @projects = Project.find(:all)

  end

  def add
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      @member = Member.new
      @member[:user_id] = session[:userID]
      @member[:project_id] = @project.id
      if @member.save
        flash[:notice] = "プロジェクトを登録しました"
        redirect_to :action => "index"
      end
    else
      flash[:notice] = "登録に失敗しました"
      redirect_to :action => "new"
    end
  end

  def delete
  end

  def share
  end

end
