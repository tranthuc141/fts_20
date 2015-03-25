class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @users = @users.normal.paginate page: params[:page]
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User has been deleted'
    redirect_to admin_users_url
  end
end
