class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    if current_user
      @user = current_user
    else
      @user = 'none'
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
     flash[:notice] = "Project Submitted"
     redirect_to projects_path
    else
     render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
  end

  def update
    @project = Project.find(params[:id])
    @users = User.all
    if @project.update(project_params)
      flash[:notice] = "Project Updated!"
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :image, :link, :user_id)
  end

end
