class User < ApplicationRecord
  has_secure_password

  validates :user_name, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :name, :address, :city, :state, :zip

  enum role: ["user", "merchant", "admin"]
 end
