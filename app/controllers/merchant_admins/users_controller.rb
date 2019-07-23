class MerchantAdmins::UsersController < MerchantAdmins::BaseController

	def dashboard
		user = current_user
		@merchant =	 Merchant.find(user.merchant_id)
		@orders = @merchant.merchant_orders
	
	end

end
