class MerchantAdmins::BaseController < ApplicationController
  before_action :require_merchant_admin

  private
    def require_merchant_admin
      unless current_merchant_admin?
        render file: "/public/404", status: 404
      end
    end
end
