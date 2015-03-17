class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  
  private
  def admin_permission
    unless current_user.is_admin?
      flash[:alert] = 'You must be Admin'
      redirect_to root_url
    end
  end
end
