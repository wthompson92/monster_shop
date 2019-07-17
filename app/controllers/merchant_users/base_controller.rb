class MerchantUsers::BaseController < ApplicationController
  before_action :require_merchant_user

    def dashboard
    end

  private
    def require_merchant_user
      unless current_merchant_user?
        render file: "/public/404", status: 404
      end
    end
end
