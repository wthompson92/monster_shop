require 'rails_helper'

RSpec.describe "User Navigation" do
  describe "As a Registered User" do
    it "My navigation bar includes the following:" do
      user = User.create!(user_name: "jori@gmail.com", password: "testing123", role: 0, name: "Jori", address: "123 Market St", city: "Denver", state: "CO", zip: 80012 )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      # within 'nav' do
      #   # click_link "Logout"
      #   # click_link "Welcome"
      #   click_link 'Login'
      # end
      #
      # fill_in :user_name, with: "jori@gmail.com"
      # fill_in :password, with: "testing123"
      #
      # click_on "Log In"

      # expect(current_path).to eq(profile_path)

      expect(page).to have_link("Welcome")
      expect(page).to have_link("Items")
      expect(page).to have_link("Merchants")
      expect(page).to have_link("Cart")
      expect(page).to have_link("Profile")
      expect(page).to have_link("Logout")

      # expect(page).to have_content("Logged in as Jori")
      #Flash or HTML??

      expect(page).not_to have_link("Login")
      expect(page).not_to have_link("Register")
    end
  end
end
