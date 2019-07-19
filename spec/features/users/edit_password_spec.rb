require 'rails_helper'

RSpec.describe do
  describe "As a registered user" do
    before :each do
      @jane = User.create!(name: "Jane Doe", user_name: "jdoe1234", password: "password",  password_confirmation: "password", address: "123 Main St", city: "Denver", state: "Colorado", zip: 80301)
      visit root_path
      click_link "Login"
      fill_in "User name", with: "jdoe1234"
      fill_in "Password", with: "password"
      click_button "Log In"
      visit profile_path
    end

    describe "When I visit my profile page I see a link to edit my password
    When I click on the link to edit my password" do
      it "I see a form with fields for a new password, and a new password confirmation" do
      expect(page).to have_content("New password")
      expect(page).to have_content("New password Confirmation")
      end
    end

    describe "When I fill in the same password in both fields, And I submit the form." do
      it "Then I am returned to my profile page And I see a flash message telling me that my password is updated." do
        expect(page).to have_content("Password Updated")
        expect(current_path).to eq(profile_path)
      end
    end
  end
end
