class MerchantAdmins::UsersController < MerchantAdmins::BaseController

	def dashboard
		@user = current_user
		@merchant = Merchant.find(@user.merchant_id)
	end

end
