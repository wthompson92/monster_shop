class MerchantAdmins::UsersController < MerchantAdmins::BaseController

	def dashboard
		@user = current_user
		@merchant = Merchant.find(@user.merchant_id)
		# @order = @merchant.merchant_orders
		@merchant.merchant_orders.include?(params[:id].to_i)
		binding.pry
	end

end
