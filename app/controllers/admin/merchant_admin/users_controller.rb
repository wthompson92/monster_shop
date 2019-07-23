class Admin::MerchantAdmin::UsersController < Admin::BaseController

	def dashboard
	end

	def disable
		merchant = Merchant.find(params[:id])
		merchant.disable
		flash[:message] = "#{merchant.name} is now disabled."
		rediect_to merchants_path 
	end
end
