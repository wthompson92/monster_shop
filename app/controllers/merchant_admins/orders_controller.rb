class MerchantAdmins::OrdersController < MerchantAdmins::BaseController

  def show
    @merchant = Merchant.find(current_user.merchant_id)
    @items = @merchant.order_items
    @order = Order.find(params[:id])
    @customer = @order.customer
  end
end 
