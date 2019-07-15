require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_link "Register"

    expect(current_path).to eq(new_user_path)

    fill_in "User Name", with: "jsmith123"
    fill_in "Password", with: "password123"

    click_on "Create Profile"

    new_user = User.last

    expect(page).to have_content("Welcome, #{new_user.user_name}!")
  end
end
