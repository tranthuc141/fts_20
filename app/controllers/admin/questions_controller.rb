class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @question = Question.find params[:id]
    @options = @question.options
  end

  def new
    @course = Course.find params[:course_id]
    4.times {@question.options.build}
  end

  def create
    if @question.save
      flash[:notice] = 'Question has been created'
      redirect_to admin_course_path @question.course
    else
      render 'new'
    end
  end

  def edit
    @course = @question.course
  end

  def update
    if @question.update_attributes question_params
      redirect_to admin_course_path @question.course
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to admin_course_path @question.course
  end

  private
  def question_params
    params.require(:question).permit :course_id, :type_question,
      :content, options_attributes: [:id, :content, :correct]
  end
end