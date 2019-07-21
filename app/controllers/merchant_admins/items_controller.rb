class MerchantAdmins::ItemsController < MerchantAdmins::BaseController

  def update
    item = Item.find(params[:id])

    if item.active == false
       item.update(active: true)
       item.reload
       flash[:notice] = "#{item.name} is now for sale."
     else
      item.update(active: false)
      item.reload
      flash[:notice] = "#{item.name} is no longer for sale."
    end
     redirect_to "/merchants/#{params[:merchant_id]}/items"
   end
end
