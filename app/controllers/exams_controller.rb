class ExamsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @courses = Course.all
    checked = params[:checked].to_i + params[:uncheck].to_i
    @exam = current_user.search_with_course params[:search], checked
  end

  def create
    @exam.user = current_user
    if @exam.save
      redirect_to exams_path
    else
      flash[:notice] = "Can't submit, something wrong"
    end
  end

  def destroy
    @exam.destroy
    flash[:notice] = 'Exam has been deleted'
    redirect_to user_path @exam.user
  end

  private
  def exam_params
    params.require(:exam).permit :course_id, :user_id, :status
  end
end