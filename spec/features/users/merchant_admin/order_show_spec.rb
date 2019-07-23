RSpec.describe "Merchant Edit Item" do
  describe "As a merchant admin" do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @merchant_admin = User.create!(user_name: "nathan@gmail.com", password: "password123", role: 1, name: "Nathan", address: "123 Market St", city: "Denver", state: "CO", zip: 80012, merchant_id: @megan.id )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_admin)
    end

    describe "When I visit an order show page from my dashboard" do
      it "I see the customer's name and address" do

      end

      it "I only see the items in the order that are being purchased from my merchant and do not see items in the order from other merchants." do

      end

      it "For each item I see the name of the Item, whis is a link to the item show page." do

      end

      it "I see an image of the item, my price for the item  and the quantity the user wants to purchase" do

      end


      describe "If the user's desired quantity is greater than my current inventory quantity for that item" do
        it "I do not see a fulfill button or link. Instead I see a notice next to the item indicating I cannot fulfill this item"  do
        end
      end 
    end
  end
end
