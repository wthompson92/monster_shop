require 'rails_helper'

RSpec.describe "User Login" do
  describe "As a Visitor" do
    before :each do
      visit new_profile_path
      fill_in "Name", with: "John Smith"
      fill_in "User name", with: "jsmith123"
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password123"
      fill_in "Address", with: "123 Main St"
      fill_in "City", with: "Denver"
      fill_in "State", with: "Colorado"
      fill_in "Zip", with: 80501
      click_button "Create User"
      @new_user = User.last
    end

  xit "When I click the link to login I am taken to a login form" do
    visit root_path
    click_link "Login"
    expect(current_path).to eq(login_path)
    fill_in "User name", with: "jsmith123"
    fill_in "Password", with: "password123"
    click_button "Log In"

    expect(current_path).to eq(profile_path)
    end

    xit "When I fill in with wrong credentials, i am redirected to login page and I get a flash message telling me that username/password invalid." do
      visit root_path
      click_link "Login"
      expect(current_path).to eq(login_path)
      fill_in "User name", with: "jsmith123"
      fill_in "Password", with: "password"
      click_button "Log In"
      expect(page).to have_content "User name and/or password invalid."
    end
  end
end
