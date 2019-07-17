class User < ApplicationRecord
  has_secure_password

  validates :user_name, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :name, :role, :address, :city, :state, :zip, require: true

  has_many :orders
end
