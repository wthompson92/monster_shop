# require 'rails_helper'
#
# RSpec.describe "Merchant Navigation" do
#   descibe "As a user who works for a merchant" do
#     it "My navigation bar includes the following:" do
#       admin = User.create!(user_name: "andrew@gmail.com", password: "thinking123", role: 3, address: "333 Market St", city: "Denver", state: "CO", zip: 80012 )
#
# =>    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#
#       visit root_path
#
#       fill_in :user_name, with "andrew@gmail.com"
#       fill_in :password, with "thinking123"
#
#       expect(current_path).to eq(admin_user_path(admin))
#
#       expect(page).to have_link("Welcome")
#       expect(page).to have_link("Items")
#       expect(page).to have_link("Merchants")
#       expect(page).to have_link("Admin Dashboard")
#       expect(page).to have_link("Logout")
#       expect(page).to have_link("All Users")

        # expect(page).not_to have_link("Cart")
        # expect(page).not_to have_link("Login")
        # expect(page).not_to have_link("Register")
#     end
#   end
# end
