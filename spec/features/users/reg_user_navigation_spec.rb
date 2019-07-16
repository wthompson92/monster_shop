# require 'rails_helper'
#
# RSpec.describe "User Navigation" do
#   descibe "As a Registered User" do
#     it "My navigation bar includes the following:" do
#       reg_user = User.create!(user_name: "jori@gmail.com", password: "testing123", role: 1, address: "123 Market St", city: "Denver", state: "CO", zip: 80012 )

# =>    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(reg_user)
#
#       visit root_path
#
#       fill_in :user_name, with "jori@gmail.com"
#       fill_in :password, with "testing123"
#
#       expect(current_path).to eq(reg_user_path(reg_user))
#
#       expect(page).to have_link("Welcome")
#       expect(page).to have_link("Items")
#       expect(page).to have_link("Merchants")
#       expect(page).to have_link("Cart")
#       expect(page).to have_link("Profile")
#       expect(page).to have_link("Logout")
#
#       expect(page).to have_content("Logged in as Jori Peterson")
#       # We need name to be added to Users Table**

# =>    expect(page).not_to have_link("Login")
#       expect(page).not_to have_link("Register")
#
#     end
#   end
# end
