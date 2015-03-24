class ResultsController < ApplicationController
  before_action :authenticate_user!

  def show
    @result = Result.find params[:id]
  end
  
  def create
    @result = Result.new result_params
    if @result.save
      redirect_to exams_path
    else
      flash[:notice] = "Can't submit, something wrong"
    end
  end

  private
  def result_params
    params.require(:result).permit :exam_id,
      answers_attributes: [:id, :option_id, :question_id]
  end
end
