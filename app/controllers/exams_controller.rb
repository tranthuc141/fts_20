class ExamsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @courses = Course.all
  end

  def create
    @exam.user = current_user
    if @exam.save
      redirect_to exams_path
    else
      flash[:notice] = "Can't submit, something wrong"
    end
  end

  private
  def exam_params
    params.require(:exam).permit :course_id, :user_id, :status
  end
end