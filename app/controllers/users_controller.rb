class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @user = User.find params[:id]
    exams = params[:type] && params[:type] != 'all' ?
      @user.exams.send(params[:type]) : @user.exams
    @exams = @user.search_with_course exams, params[:search]
  end
end
