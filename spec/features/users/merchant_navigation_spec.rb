require 'rails_helper'

RSpec.describe "Merchant Navigation" do
  describe "As a user who works for a merchant" do
    it "My navigation bar includes the following:" do
      merchant = User.create!(user_name: "nathan@gmail.com", password: "password123", role: 1, name: "Nathan", address: "123 Market St", city: "Denver", state: "CO", zip: 80012 )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merchant)

      visit root_path

      expect(page).to have_link("Welcome")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")

      expect(page).to have_link("Merchant Dashboard")
      expect(page).to have_link("Logout")
      expect(page).not_to have_link("Login")
      expect(page).not_to have_link("Register")
    end

    it 'does not allow merchant_user to see admin dashboard' do

      visit admin_dashboard_path

      expect(page).to_not have_content("Admin Dashboard")
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page.status_code).to eq(404)
    end

    it 'does not allow merchant_user to see user profile' do

      visit profile_path

      expect(page).to_not have_content("Profile")
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page.status_code).to eq(404)
    end

    # it 'does not allow merchant_user to see the cart' do
    #
    #   visit cart_path
    #   expect(page).to_not have_content("Cart")
    #   expect(page).to have_content("The page you were looking for doesn't exist.")
    #   expect(page.status_code).to eq(404)
    # end
  end
end
