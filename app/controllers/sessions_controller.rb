class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
      redirect_to profile_path#user_path(user)
      flash[:notice] = "Logged in a #{user.name}"
    else
      flash.now[:alert] = "user name and/or password invalid."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:cart)
    flash[:alert] = "You have been logged out"
    redirect_to root_path
  end

end
