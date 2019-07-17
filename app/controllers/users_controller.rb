class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
   end

  def new
    @user = User.new(user_params)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:success] = "You have been registered and logged in!"
    else
      flash.now[:error] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
      params.permit(:name, :user_name, :password, :password_confirmation, :address, :zip, :city, :state)
  end
end
