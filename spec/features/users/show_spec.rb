require 'rails_helper'

RSpec.describe do
  describe "User Show Page" do
    before :each do
      nathan = User.create!(user_name: "nthomas", password: "123",  password_confirmation: "123", name: "Nathan Thomas", address: "123 Main St", city: "Gunbarrel", state: "Colorado", zip: 80301)
      visit root_path
      click_link "Login"
      fill_in "User name", with: "nthomas"
      fill_in "Password", with: "123"
      click_button "Log In"
    end

  describe "As a registered user" do
    describe "When I visit my profile page" do
      it "then I see all of my profile data on the page except my password" do
        expect(page).to have_content("Nathan Thomas")
        expect(page).to have_content("Address: 123 Main St")
        expect(page).to have_content("City: Gunbarrel")
        expect(page).to have_content("State: Colorado")
        expect(page).to have_content("Zip: 80301")
        expect(page).to have_link("Edit Profile")
        end
      end
    end
  end
end
