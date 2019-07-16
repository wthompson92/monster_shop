class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
   end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "#{user.user_name} created"
    else
      render :new
      # generate_flash(user)
    end
  end

  def destroy
    session.delete(:user_name)
    redirect_to root_path
  end

  private

  def user_params
      params.permit(:user_name, :password)
  end
end
