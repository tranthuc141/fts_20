class CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @courses = Course.all.paginate page: params[:page]
  end
  
  def show
    @course = Course.find params[:id]
  end
end
