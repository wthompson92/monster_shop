require 'rails_helper'

RSpec.describe "Merchant Dashboard" do
	describe "As a merchant" do
		before :each do
			@megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @merchant_admin = User.create!(user_name: "nathan@gmail.com", password: "password123", role: 1, name: "Nathan", address: "123 Market St", city: "Denver", state: "CO", zip: 80012, merchant_id: @megan.id )

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
	end
end
# This is the landing page when a merchant logs in. Here, they will see their contact information (but cannot change it), some statistics, and a list of pending orders that require the merchant's attention.


# User Story 33, Merchant Dashboard displays Orders
#
# As a merchant
# When I visit my merchant dashboard ("/merchant")
# If any users have pending orders containing items I sell
# Then I see a list of these orders.
# Each order listed includes the following information:
# - the ID of the order, which is a link to the order show page ("/merchant/orders/15")
# - the date the order was made
# - the total quantity of my items in the order
# - the total value of my items for that order
