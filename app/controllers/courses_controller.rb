class CoursesController < ApplicationController
  def index
    @course = Course.new
    @courses = Course.find(:all) 
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      flash[:notice] = "You are done."
    end
    @courses = Course.all
    respond_to do |format|
      format.html { redirect_to '/courses' }
      format.js
    end
  end

  def show
    @course = Course.find_by_id(params[:id])
    if @course.nil?
      redirect_to '/courses'
    else
      @users = @course.users
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:success] = "Course updated."
      respond_to do |f|
        f.html { redirect_to @course }
        f.js 
      end
    else
      @title = "Edit course"
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    course_name = @course.name
    @course.destroy
    flash[:success] = "Course \"#{course_name}\" destroyed."
    respond_to do |f|
      f.html { redirect_to courses_path }
      f.js
    end
  end
end
