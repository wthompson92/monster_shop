class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart, :current_user, :current_merchant_user?, :current_admin?, :require_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    unless current_user && !current_merchant_user? && !current_admin?
      render file: "/public/404", status: 404
    end
  end

  def current_merchant_user?
    current_user && current_user.merchant_user?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def generate_flash(resource)
    resource.errors.messages.each do |validation, message|
      flash[validation] = "#{validation}: #{message}"
    end
  end
end
