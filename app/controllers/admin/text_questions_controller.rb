class Admin::TextQuestionsController < ApplicationController

  def show
    @text_question = TextQuestion.find params[:id]
  end

  def new
    @course = Course.find params[:course_id]
    @text_question = TextQuestion.new
  end

  def create
    @text_question = TextQuestion.new text_question_params
    if @text_question.save
      redirect_to admin_course_path @text_question.course
    else
      render 'new'
    end
  end

  def edit
    @text_question = TextQuestion.find params[:id]
    @course = @text_question.course
  end

  def update
    @text_question = TextQuestion.find params[:id]
    if @text_question.update_attributes text_question_params
      redirect_to admin_course_path @text_question.course
    else
      render 'edit'
    end
  end

  def destroy
    @text_question = TextQuestion.find params[:id]
    @text_question.destroy
    flash[:success] = "Question deleted"
    redirect_to admin_course_path @text_question.course
  end

  private
  def text_question_params
    params.require(:text_question).permit :course_id, :content, :sample_answer
  end
end
