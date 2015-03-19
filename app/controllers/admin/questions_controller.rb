class Admin::QuestionsController < ApplicationController
  def new
    @course = Course.find params[:course_id]
    @question = Question.new
    4.times {@question.options.build}
  end

  def show
    @question = Question.find params[:id]
    @options = @question.options
  end

  def index
  end

  def edit
    @question = Question.find params[:id]
    @course = @question.course
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      redirect_to admin_course_path @question.course
    else
      render 'edit'
    end
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to admin_course_path @question.course
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to admin_course_path @question.course
  end

  private
  def question_params
    params.require(:question).permit :course_id,
      :content, options_attributes: [:id, :content, :correct]
  end
end