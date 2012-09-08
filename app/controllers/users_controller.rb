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

  def show
    @user = User.find_by_id(params[:id])
    @courses = @user.courses
  end
  
  def add_course 
    @user = User.find_by_id(params[:id])
    @course = Course.find_by_id(params[:course_id])
    @user.courses << @course
    redirect_to user_path @user
  end

end
