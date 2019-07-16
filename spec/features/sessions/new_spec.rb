require 'rails_helper'

RSpec.describe "User Login" do
    before :each do
    visit new_user_path
    fill_in "User name", with: "jsmith123"
    fill_in "Password", with: "password123"
    fill_in "address", with: "123 Main St"
    click_button "Create Profile"
  end

  it "logs an existing user in and redirects them to the user show page." do
    visit root_path
  click_link "Login"
  fill_in "User name", with: "jsmith123"
  fill_in "Password", with: "password123"
  click_button "Log In"
  expect(current_path).to eq(user_path(current_user))
  # expect(page).to have_content("user_name: [\"can't be blank\"]")
  end
end
