class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    checked = params[:checked].to_i + params[:uncheck].to_i
    @exam = @user.search_with_course params[:search], checked
  end
end
