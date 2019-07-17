class UsersController < ApplicationController
  before_action :require_current_user, only: [:show]

  def index
    @users = User.all
  end

  # ADD IF STATEMENT SO YOU KNOW WHICH ONE OF THESE TO USE
  def show
    @user = current_user
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new(user_params)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "#{user.user_name} created"
      redirect_to profile_path #user_path(user)
    else
      render :new
      generate_flash(user)
    end
  end

  private

  def user_params
      params.permit(:name, :user_name, :password, :address, :zip, :city, :state)
  end
end
