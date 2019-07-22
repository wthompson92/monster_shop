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

  def sorted
    self.order(:status)
  end

  def cancel_order
    update_attributes(status: :cancelled)
      order_items.each do |oi|
        oi.fulfilled = false
        # p oi.item.inventory
        oi.item.inventory += oi.quantity
        # p oi.item.inventory
      end
  end

end
