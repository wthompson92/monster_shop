require 'rails_helper'

Rspec.describe do
  describe "Edit User Profile" do
    describe "As a registered user, when I visit my profile page" do
      @nathan = User.create!(user_name: "nthomas", password: "password",  password_confirmation: "password", name: "Nathan Thomas", address: "123 Main St", city: "Gunbarrel", state: "Colorado", zip: 80301)
      visit root_path
      click_link "Login"
      fill_in "User name", with: "nthomas"
      fill_in "Password", with: "password"
      click_button "Log In"
    end
    
    it "I can click a link to edit my profile data and am taken to a new form and the form is prepopulated" do
      click_link "Edit Profile"

      expect(page).to have_content("Nathan Thomas")
      expect(page).to have_content("123 Main St")
      expect(page).to have_content("Colorado")
      expect(page).to have_content("80301")
      expect(page).to_not have_content("password")
    end

    it "I am returned to my profile page and I see a flash message telling me that my data is updated. I see my updated information" do
      expect(current_path).to eq(user_path(@nathan))

      expect(page).to have_content("Nathan Thomas")
      expect(page).to have_content("123 Main St")
      expect(page).to have_content("Colorado")
      expect(page).to have_content("80301")
      expect(page).to_not have_content("password")
    end
  end
end
