class MerchantAdmins::OrdersController < MerchantAdmins::BaseController

def show
  @order = Order.find(params[:id])
  binding.pry
end
end
