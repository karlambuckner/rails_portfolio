class ProjectsController < ApplicationController

  def index
    @projects = Project.all
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

  private
  def project_params
    params.require(:project).permit(:name, :description, :user_id)
  end

end
