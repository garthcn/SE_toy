class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.find(:all)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You are done."
    end
    redirect_to '/users'
  end

end
