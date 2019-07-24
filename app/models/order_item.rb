class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    quantity * price
  end

   def subtract_inventory
     inventory - quantity
   end

   def fulfill_order
       self.update_attributes(fulfilled: true)
   end
end
