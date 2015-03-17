class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_permission
  
  def index
    @users = User.normal.paginate page: params[:page]
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = 'User has been deleted'
    redirect_to admin_users_url
  end
end
