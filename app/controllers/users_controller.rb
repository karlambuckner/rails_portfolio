class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update_attribute(:avatar, params[:user][:avatar])
  end
end
