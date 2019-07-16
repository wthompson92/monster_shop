# require 'rails_helper'
#
# RSpec.describe "Visitor Navigation" do
#   descibe "As a visitor" do
#     it "My navigation bar includes the following:" do
#
#       visit root_path
#
#       expect(page).to have_link("Welcome")
#       expect(page).to have_link("Items")
#       expect(page).to have_link("Merchants")
#       expect(page).to have_link("Cart")
#       expect(page).to have_link("Login")
#       expect(page).to have_link("Register")
#     end
#
#     it "Next to the cart link I see a count of items in my cart" do
#
#       visit root_path
#
#       within 'nav' do
#         expect(page).to have_content(cart.count)
#       end
#     end
#   end
# end
