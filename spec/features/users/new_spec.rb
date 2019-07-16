require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_link "Register"

    expect(current_path).to eq(new_user_path)

    fill_in "User name", with: "jsmith123"
    fill_in "Password", with: "password123"
    fill_in "address", with: "123 Main St"
    fill_in "Password", with: "password123"

    click_button "Create Profile"

    new_user = User.last

    expect(page).to have_content("Welcome")
  end

describe "I do not fill in this form completely" do
it "redirects to the form with a flash message for missing fields" do
  visit new_user_path
  fill_in "Password", with: "password123"
  fill_in "address", with: "123 Main St"
  fill_in "Password", with: "password123"
  expect(current_path).to eq(new_user_path)
  # expect(page).to have_content("user_name: [\"can't be blank\"]")

end
end
end
