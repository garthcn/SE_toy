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
    redirect_to '/courses'
  end
end
