class Order < ApplicationRecord
  validates_presence_of :status

  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items	

  enum status: %w(pending packaged shipped cancelled)

  def grand_total
    order_items.sum('price * quantity')
  end

  def sorted
    self.order(:status)
  end
end
