class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
		 	if current_user.user? && current_user.merchant_id
				redirect_to merchant_dashboard_path
	 		elsif current_user.user?
      	redirect_to profile_path
			elsif current_user.merchant_admin?
				redirect_to merchant_dashboard_path
			elsif current_user.admin?
				redirect_to admin_dashboard_path
			end
      flash[:success] = "Logged in a #{user.name}"
    else
      flash.now[:alert] = "User name and/or password invalid."
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
