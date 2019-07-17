require 'rails_helper'


RSpec.describe User, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:user_name)}
    it {should validate_uniqueness_of(:user_name)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:zip)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
  end

   describe "Relationships" do
     it {should have_many(:orders)}
  end
end
