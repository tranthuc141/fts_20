class ExamsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @courses = Course.all
    exams = params[:type] && params[:type] != 'all' ?
      current_user.exams.send(params[:type]) : current_user.exams
    @exams = current_user.search_with_course exams, params[:search]
  end

  def show
    @exam = Exam.find params[:id]
  end

  def create
    @exam.user = current_user
    if @exam.save
      flash[:notice] = 'Exam has been created'
      redirect_to exams_path
    else
      redirect_to exams_path
      flash[:alert] = "Can't submit, something wrong"
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