class UsersController < ApplicationController
  before_action :authenticate_user!, :authenticate_admin!
  
  def index
    @users = User.all
  end

  def destory
    user = User.find_by id: params[:id]
    if user.present?
      user.destroy
      redirect_to admin_users_path
    end
  end

  private
  def users_params
    params.require(:user).permit(:id)
  end
  def authenticate_admin!
    redirect_to root_path unless current_user.admin?
  end
end
