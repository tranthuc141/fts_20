class ResultsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"#{@result.id}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def create
    if @result.save
      redirect_to exams_path
    else
      flash[:notice] = "Can't submit, something wrong"
    end
  end

  private
  def result_params
    params.require(:result).permit :exam_id,
      answers_attributes: [:id, :option_id, :question_id, :content]
  end
end
