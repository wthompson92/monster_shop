class UsersController < ApplicationController
  before_action :require_current_user, only: [:show]
	before_action :deny_admin, only: [:show]

  # ADD IF STATEMENT SO YOU KNOW WHICH ONE OF THESE TO USE
  def show
    @user = current_user
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
      flash[:success] = "You have been registered and logged in!"
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit_password
    @user = current_user
  end

  # def update_password
  #   @user = current_user
  #   if @user.update(password_params)
  #     redirect_to profile_path
  #     flash[:success] = "Your password has been updated!"
  #   else
  #     flash.now[:error] = @user.errors.full_messages.to_sentence
  #     render :edit_password
  #   end
  # end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path
      flash[:success] = "Your profile has been updated!"
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      redirect_to :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_name, :password, :password_confirmation, :address, :zip, :city, :state, :role)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
