require 'rails_helper'

RSpec.describe "Merchant Dashboard" do
	describe "As a merchant" do
		before :each do
			@megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
			@brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @merchant_admin = User.create!(user_name: "nathan@gmail.com", password: "password123", role: 1, name: "Nathan", address: "123 Market St", city: "Denver", state: "CO", zip: 80012, merchant_id: @megan.id )
		  @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
			@mermaid = @megan.items.create!(name: 'Mermaid', description: "I'm a Mermaid!", price: 500, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 13 )
			@hippo = @brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
			@nathan = User.create!(user_name: "nthomas", password: "123",  password_confirmation: "123", name: "Nathan Thomas", address: "123 Main St", city: "Gunbarrel", state: "Colorado", zip: 80301)
			@order_1 = @nathan.orders.create!(status: 0)
			@order_2 = @nathan.orders.create!(status: 0)
			@order_item_1 = @order_1.order_items.create!(price: @ogre.price, quantity: 1, item: @ogre)
			@order_item_2 = @order_2.order_items.create!(price: @mermaid.price, quantity: 1, item: @mermaid)
			@order_1.items << @hippo
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_admin)
		end

		it 'I see my profile data on my dashboard' do

			visit merchant_dashboard_path

			expect(page).to have_content(@megan.name)
			expect(page).to have_content(@megan.address)
			expect(page).to have_content(@megan.city)
			expect(page).to have_content(@megan.state)
			expect(page).to have_content(@megan.zip)
		end

		it 'I cannot edit my profile data' do

			visit merchant_dashboard_path

			expect(page).not_to have_button("Edit")
		end

		it "It shows pending orders with merchant's items" do

			visit merchant_dashboard_path

			within "#order-#{@order_1.id}" do
				expect(page).to have_link(@order_1.id)
				expect(page).to have_content(@order_1.created_at)
				expect(page).to have_content(@megan.merchant_quantity)
				expect(page).to have_content(@megan.merchant_value)
			end
		end
	end
end
