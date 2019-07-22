class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :order_items, through: :items
  has_many :users

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

  def item_count
    items.count
  end

  def average_item_price
    items.average(:price)
  end

  def distinct_cities
    order_items.joins('JOIN orders ON order_items.order_id = orders.id')
               .joins('JOIN users ON orders.user_id = users.id')
               .order('city_state')
               .distinct
               .pluck("CONCAT_WS(', ', users.city, users.state) AS city_state")
  end

	def merchant_orders(merchant_id)
		Order.joins(:items).where('items.merchant_id = merchant_id)
		# binding.pry
  end
end
