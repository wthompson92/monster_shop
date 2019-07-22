class Item < ApplicationRecord
  belongs_to :merchant
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy

  validates_presence_of :name,
                        :description,
                        :price,
                        :inventory


  # validates :name, :description, :image, :price, :inventory, presence: {message: "cannot be missing."}
  #
  #validates :price, :inventory, numericality: {message: "must be a valid number."}

  def sorted_reviews(limit = nil, order = :asc)
    reviews.order(rating: order).limit(limit)
  end

  def average_rating
    reviews.average(:rating)
  end

  def purchased
    OrderItem.all.pluck(:item_id)
  end

  def self.favorite_items
    names = Item.top_5_names
    counts = Item.top_5_quantity
    names_and_counts = {}
    names.length.times do |i|
      names_and_counts[names[i]] = counts[i]
    end
    names_and_counts
  end

  def self.least_favorite_items
    names = Item.bottom_5_names
    counts = Item.bottom_5_quantity
    names_and_counts = {}
    names.length.times do |i|
      names_and_counts[names[i]] = counts[i]
    end
    names_and_counts
  end

private

  def self.top_5_names
    top_five = OrderItem.all.order(quantity: :desc).select(:item_id).limit(5).pluck(:item_id)
    top_five_names = Item.select(:name).where(id: top_five).pluck(:name).flatten.reverse
  end

  def self.top_5_quantity
    top_five_quantity = OrderItem.all.order(:quantity).reverse_order.select(:quantity).limit(5).pluck(:quantity).flatten
  end


  def self.bottom_5_names
    bottom_five = OrderItem.all.order(:quantity).select(:item_id).limit(5).pluck(:item_id)
    bottom_five_names = Item.select(:name).where(id: bottom_five).pluck(:name).flatten.reverse
  end

  def self.bottom_5_quantity
    bottom_five_quantity = OrderItem.all.order(:quantity).select(:quantity).limit(5).pluck(:quantity).flatten
  end

end

  #make model method spec test for items statistics
