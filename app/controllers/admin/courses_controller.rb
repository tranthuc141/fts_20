class Admin::CoursesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @courses = Course.all.paginate page: params[:page]
  end

  def show
    @questions = @course.questions
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"#{@course.name}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def create
    if @course.save
      flash[:notice] = 'Course has been created'
      redirect_to admin_course_path @course
    else
      render 'new'
    end
  end

  def update
    @course.update_attributes course_params
    flash[:notice] = 'Course has been updated'
    redirect_to admin_course_path @course
  end

  def destroy
    @course.destroy
    flash[:notice] = 'Course has been deleted'
    redirect_to admin_courses_url
  end

  private
  def course_params
    params.require(:course).permit :name, :time_limit, :description
  end
end
