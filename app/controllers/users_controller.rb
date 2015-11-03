class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  private
#only allow whitelisted fields to be populated and passed
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
