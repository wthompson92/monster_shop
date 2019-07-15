class UsersController < ApplicationController

  def show
     @user = User.find(params[:id])
   end

  def new
  end


  def create
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
  else
    render :new
  end
end


  def destroy
    session.delete(:user_name)
  redirect_to root_path
  end

  private

  def user_params
      params.require(:user).permit(:username, :password)
    end
end
