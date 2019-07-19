require 'rails_helper'

RSpec.describe do
  describe "Edit User Profile" do
    describe "As a registered user, when I visit my profile page" do
      before :each do
        @jane = User.create!(name: "Jane Doe", user_name: "jdoe1234", password: "password",  password_confirmation: "password", address: "123 Main St", city: "Denver", state: "Colorado", zip: 80301)
        visit root_path
        click_link "Login"
        fill_in "User name", with: "jdoe1234"
        fill_in "Password", with: "password"
        click_button "Log In"
        visit profile_path
      end

      it "I can click a link to edit my profile data and am taken to a new form and the form is prepopulated" do
        click_link "Edit Profile"

        expect(page).to have_content("Jane Doe")
        expect(page).to have_content("jdoe1234")
        expect(page).to have_content("123 Main St")
        expect(page).to have_content("Denver")
        expect(page).to have_content("Colorado")
        expect(page).to have_content("80501")
        expect(page).to_not have_content("password")

        click_button "Update Profile"
      end

      it "I am returned to my profile page and I see a flash message telling me that my data is updated. I see my updated information" do

        click_link "Edit Profile"

        fill_in "Name", with: "John Smith"
        fill_in "User name", with: "Jsmith"
        fill_in "Address", with: "456 North St"
        fill_in "City", with: "New York City"
        fill_in "State", with: "New York"
        fill_in "Zip", with: "00000"
        click_button "Update Profile"
        expect(current_path).to eq(profile_path)
        expect(page).to have_content("John Smith")
        expect(page).to have_content("456 North St")
        expect(page).to have_content("New York")
        expect(page).to have_content("00000")
        expect(page).to_not have_content("password")
        expect(page).to have_content("Your profile has been updated!")
      end
    end
  end
end
