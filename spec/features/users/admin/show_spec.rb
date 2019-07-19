require 'rails_helper'

RSpec.describe "Admin User Show Page" do
  describe "As an admin" do
    before :each do
      @admin = User.create!(user_name: "andrew@gmail.com", password: "thinking123", role: 2, name: "Andrew", address: "333 Market St", city: "Denver", state: "CO", zip: 80012 )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_users_path
    end

  describe "When I click a name on the users page "do
  it  "it takes me to that users page, where I see all information except for Edit Profile, and Edit Password Buttons" do

      expect(current_path).to eq(admin_user_path)
      expect(page).to have_content(@megan.name)
      expect(page).to have_content(@megan.user_name)
      expect(page).to have_content(@megan.address)
      expect(page).to have_content(@megan.city)
      expect(page).to have_content(@megan.state)
      expect(page).to have_content(@megan.zip)
      expect(page).to_not have_link("Edit Profile")
      expect(page).to_not have_link("Edit Password")
  end
end
