class Order < ApplicationRecord
  validates_presence_of :status

  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(pending packaged shipped cancelled)

  def grand_total
    order_items.sum('price * quantity')
  end

  def total_quantity
    order_items.sum(:quantity)
  end

  def package_order
    self.update_attributes(status: 1)
  end

  def ship_order
    self.update_attributes(status: 2)
  end

  def cancel_order
    update_attributes(status: 3)

end
   def fulfill_order
     order_items.each do |oi|
     oi.update(fulfilled: true)
      oi.item.inventory - oi.quantity
      oi.save
    end
  end
 #
 # #    def subtract_inventory
 # #      order_items.each do |oi|
 # #      oi.inventory - oi.quantity
 # #    end
 # # end
 #      # order_items.update_attributes(:fulfilled, true)
 #    end



  def customer
    self.user
  end
end
