require 'rails_helper'

RSpec.describe "Merchant (Merchant_admin role: 1) Can add an item" do
  describe "As a merchant" do
    before :each do
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
      @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: false, inventory: 3 )

      @user_1 = User.create!(name: "Lucifer", user_name: "iheartmonsters", password: "Monsters!", role: 0, address: "666 Hells Gate", city: "Hell", state: "LA", zip: "71220")

      @order_1 = @user_1.orders.create!

      @order_1.order_items.create!(item: @ogre, price: @ogre.price, quantity: 3)

      @merchant_admin = User.create!(user_name: "nathan@gmail.com", password: "password123", role: 1, name: "Nathan", address: "123 Market St", city: "Denver", state: "CO", zip: 80012, merchant_id: @megan.id )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_admin)
    end

    it ' when I visit my items page I see a link to add a new item. When I click the link I see a form where I can add new info about an item' do
      visit "/merchants/#{@megan.id}/items"

      # click_link("New Item")
      # expect(current_path).to eq("/merchants/#{@merchant.id}/items/new")
      # save_and_open_page
      #start on this test in next branch -- above route is not correct
      #item's index already has a link to add a new item.
    end

    it 'when I submit valid information and submit the form I am redirected to my items page where I see a flash message that says my new item is saved' do
    end

    it 'on my items page I also see the new item and that it is enabled and available for sale. The image has a placeholder image if the image field was left blank.' do
    end
  end
end
