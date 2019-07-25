class MerchantAdmins::ItemsController < MerchantAdmins::BaseController

  def index
    user = current_user
    @merchant =	 Merchant.find(user.merchant_id)
    @items = @merchant.items
    render "/items/index"
  end

  def activate
    item = Item.find(params[:item_id])

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
		 @item = Item.new
  end

  def create
    user = current_user
    @merchant = Merchant.find(user.merchant_id)
    @item = @merchant.items.new(item_params)
    @item.image = params[:image]
    # || 'https://encrypted-tbn0.gstatic.comimages?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw'
    if @item.save
      redirect_to "/merchants/#{@merchant.id}/items"
      flash[:success] = "#{@item.name} has been saved."
    else
      generate_flash(@item)
      render :new
    end
  end

	def edit
    @item = Item.find(params[:id])
  end

	def update
		user = current_user
    @merchant = Merchant.find(user.merchant_id)
		@item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to "/merchants/#{@merchant.id}/items"
			flash[:success] = "#{@item.name} has been updated"
    else
      generate_flash(@item)
      render :edit
    end
	end

	def destroy
		item = Item.find(params[:id])
		if current_merchant_admin?
			if item.orders.empty?
				item.destroy
				flash[:success] = "#{item.name} has been deleted."
			end
				redirect_to "/merchants/#{params[:merchant_id]}/items"
		else
			if
				item.orders.empty?
				item.destroy
			else
				flash[:danger] = "#{item.name} can not be deleted - it has been ordered!"
			end
			redirect_to '/items'
		end
	end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :inventory)
  end
end
