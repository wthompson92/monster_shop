  class User < ApplicationRecord
  validates :user_name, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :name, :address, :city, :state, :zip
  has_secure_password
 end
