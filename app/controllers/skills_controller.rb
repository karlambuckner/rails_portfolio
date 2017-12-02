class SkillsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  before_action :only => [:new, :edit] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    if current_user
      @user = current_user
    else
      @user = 'none'
    end
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
     flash[:notice] = "Skill Submitted"
     redirect_to skills_path
    else
     render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    @users = User.all
  end

  def update
    @skill = Skill.find(params[:id])
    @users = User.all
    if @skill.update(skill_params)
      flash[:notice] = "Skill Updated!"
      redirect_to skills_path
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    flash[:notice] = "Skill successfully deleted!"
    redirect_to skills_path
  end

  private
  def skill_params
    params.require(:skill).permit(:skill, :user_id)
  end

end
