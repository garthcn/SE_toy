class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.find(:all)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User created."
    end
    redirect_to '/users'
  end

  def show
    @user = User.find_by_id(params[:id])
    @courses = @user.courses
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    user_name = @user.name
    @user.destroy
    flash[:success] = "User \"#{user_name}\" destroyed."
    redirect_to users_path
  end
  
  def add_course 
    @user = User.find_by_id(params[:id])
    @course = Course.find_by_id(params[:course_id])
    @user.courses << @course
    redirect_to user_path @user
  end

end
