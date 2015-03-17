class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_permission
  
  def index
    @users = User.normal.paginate page: params[:page]
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = "User has been deleted"
    redirect_to admin_users_url
  end

  private
  def admin_permission
    unless current_user.is_admin?
      flash[:alert] = 'You must be Admin'
      redirect_to root_url
    end
  end
end
