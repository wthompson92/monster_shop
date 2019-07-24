class Admin::MerchantsController < Admin::BaseController

	def dashboard
		@merchant = Merchant.find(params[:id])
		render "/merchant_admins/users/dashboard"
	end

	def show
    @merchant = Merchant.find(params[:id])
  end

	def disable
		merchant = Merchant.find(params[:id])
		merchant.disable
		flash[:message] = "#{merchant.name} is now disabled."
		redirect_to merchants_path
	end

	def enable
		merchant = Merchant.find(params[:id])
		merchant.enable
		flash[:message] = "#{merchant.name} is now enabled."
		redirect_to merchants_path
	end
end
