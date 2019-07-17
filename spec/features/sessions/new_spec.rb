require 'rails_helper'

RSpec.describe "User Login" do
  describe "As a Visitor" do
  before :each do
  visit new_user_path
  fill_in "Name", with: "John Smith"
  fill_in "User name", with: "jsmith123"
  fill_in "Password", with: "password123"
  fill_in "Password confirmation", with: "password123"
  fill_in "Address", with: "123 Main St"
  fill_in "City", with: "Denver"
  fill_in "State", with: "Colorado"
  fill_in "Zip", with: 80501
  click_button "Create Profile"
  @new_user = User.last
  end

  it "When I click the link to login I am taken to a login form" do
    visit root_path
  click_link "Login"
  expect(current_path).to eq(login_path)
  fill_in "User name", with: "jsmith123"
  fill_in "Password", with: "password123"
  click_button "Log In"
  expect(current_path).to eq(user_path(@new_user))
  end
end
end
