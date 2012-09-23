class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.find(:all)
    respond_to do |f|
      f.html
      f.xml { render :xml => @users.to_xml }
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User created."
    end
    @users = User.all
    respond_to do |format|
      format.html { redirect_to '/users' }
      format.js
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if !@user.nil?
      @courses = @user.courses
      @other_courses = Course.all.select { |c|
        !@courses.include?(c)
      }
    else
      redirect_to '/users'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User updated."
      respond_to do |f|
        f.html { redirect_to @user }
        f.js 
      end
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
    respond_to do |f|
      f.html { redirect_to users_path }
      f.js
    end
  end
  
  def add_course 
    @user = User.find_by_id(params[:id])
    @course = Course.find_by_id(params[:course_id])
    @user.courses << @course
    @courses = @user.courses
    respond_to do |format|
      format.html { redirect_to user_path @user }
      format.js 
    end
  end

end
