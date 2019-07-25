class MerchantAdmins::OrdersController < MerchantAdmins::BaseController

  def show
    @merchant = Merchant.find(current_user.merchant_id)
    @items = @merchant.order_items
    @order = Order.find(params[:id])
    @customer = @order.customer

    true_false = @order.order_items.all do |i|
      i.status == true
    end
      if true_false
        @order.update(status: "packaged")
      end
  end

  def update
    @order = Order.find(params[:id])
    # @order.subtract_inventory
    @order.fulfill_order
    # @order.order_items.subtract_inventory
    flash[:message] = "You have fulfilled the order"
    redirect_to merchant_admins_order_path(@order.id)
    end
	end
