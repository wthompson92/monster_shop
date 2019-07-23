class MerchantAdmins::ItemsController < MerchantAdmins::BaseController

  # before_action :get_item, only: [:new, :create]
  # before_action :get_merchant, only: [:new, :create]

  def update
    item = Item.find(params[:id])

    if item.active == false
       item.update(active: true)
       item.reload
       flash[:success] = "#{item.name} is now for sale."
    else
      item.update(active: false)
      item.reload
      flash[:warning] = "#{item.name} is no longer for sale."
    end
     redirect_to "/merchants/#{params[:merchant_id]}/items"
  end

  def new
     user = current_user
     @merchant = Merchant.find(user.merchant_id)
  end

  def create
    user = current_user
    @merchant = Merchant.find(user.merchant_id)
    @item = @merchant.items.new(item_params)
    @item.image = params[:image] || 'https://encrypted-tbn0.gstatic.comimages?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw'
    if @item.save
      redirect_to "/merchants/#{@merchant.id}/items"
      flash[:success] = "#{@item.name} has been saved."
    else
      generate_flash(@item)
      render :new
    end
  end

	def edit
		# user = current_user
		# @merchant = Merchant.find(user.merchant_id)
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :inventory)
  end
end
