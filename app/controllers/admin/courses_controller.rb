class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_permission

  def index
    @courses = Course.all.paginate page: params[:page]
  end

  def show
    @course = Course.find params[:id]
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    @course.update_attributes course_params
    flash[:notice] = 'Course has been updated'
    redirect_to admin_course_path @course
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:notice] = 'Course has been deleted'
    redirect_to admin_courses_url
  end

  private
  def course_params
    params.require(:course).permit :name, :description
  end
end
