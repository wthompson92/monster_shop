class Admin::UsersController < Admin::BaseController

  def dashboard
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
