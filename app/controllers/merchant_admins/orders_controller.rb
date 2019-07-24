class MerchantAdmins::OrdersController < MerchantAdmins::BaseController
	before_action :get_order, only: [:show, :update]

  def show
    @merchant = Merchant.find(current_user.merchant_id)
    @items = @merchant.order_items
    @customer = @order.customer
  end

  def update
    @order.fulfill_order
    flash[:message] = "You have fulfilled the order"
    redirect_to merchant_admins_order_path(@order.id)
  end

	private
	
	def get_order
		@order = Order.find(params[:id])
	end
end
