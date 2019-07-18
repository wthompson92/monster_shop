class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart, :current_user, :current_reg_user?, :current_merchant_admin?, :current_admin?, :require_current_user, :deny_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    unless current_user
      render file: "/public/404", status: 404
  	end
  end

	def require_current_reg_user
    unless current_reg_user?
      render file: "/public/404", status: 404
  	end
  end

	def current_reg_user?
		current_user && current_user.user?
	end

  def current_merchant_admin?
    current_user && current_user.merchant_admin?
  end

  def current_admin?
    current_user && current_user.admin?
  end

	def deny_admin
		if current_user.admin?
			render file: "/public/404", status: 404
		end
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
