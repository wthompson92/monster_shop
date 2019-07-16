class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
      generate_flash(user)
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path

  end

end
