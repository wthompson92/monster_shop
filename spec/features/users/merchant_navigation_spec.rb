# require 'rails_helper'
#
# RSpec.describe "Merchant Navigation" do
#   descibe "As a user who works for a merchant" do
#     it "My navigation bar includes the following:" do
#       merchant = User.create!(user_name: "nathan@gmail.com", password: "password123", role: 2, name: "Nathan", address: "123 Market St", city: "Denver", state: "CO", zip: 80012 )

# =>    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merchant)
#
#       visit root_path
#
#       fill_in :user_name, with "nathan@gmail.com"
#       fill_in :password, with "password123"
#
#       expect(current_path).to eq(merchant_user_path(merchant))
#
#       expect(page).to have_link("Welcome")
#       expect(page).to have_link("Items")
#       expect(page).to have_link("Merchants")
#       expect(page).to have_link("Cart")
#       expect(page).to have_link("Merchant Dashboard")
#       expect(page).to have_link("Logout")

# =>    expect(page).not_to have_link("Login")
#       expect(page).not_to have_link("Register")
#     end
#   end
# end
