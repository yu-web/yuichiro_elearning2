class Admin::UsersController < ApplicationController
  def home

  end

  def index
    @users = User.paginate(page: params[:page],per_page: 7)
  end
  

  def update
    @user = User.find(params[:id])
    @user.update(admin: true)
    redirect_to admin_users_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(admin: false)
    redirect_to admin_users_url
  end
end
