class MerchantUser::BaseController < ApplicationController
  before_action :require_merchant_user

  private
    def require_merchant_user
      render file: "/public/404" unless current_merchant_user?
    end
end
